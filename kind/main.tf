module "istio" {
  source = "../"

  cluster_name   = var.cluster_name
  base_domain    = var.base_domain
  subdomain      = var.subdomain
  cluster_issuer = var.cluster_issuer
  argocd_project = var.argocd_project
  argocd_labels  = var.argocd_labels

  project_source_repo    = var.project_source_repo
  namespace              = var.namespace
  argocd_namespace       = var.argocd_namespace
  destination_cluster    = var.destination_cluster
  target_revision        = var.target_revision
  enable_service_monitor = var.enable_service_monitor
  app_autosync           = var.app_autosync
  gateway                = true

  helm_values = var.helm_values

  dependency_ids = var.dependency_ids
}

resource "null_resource" "dependencies" {
  triggers = {
    istio = module.istio.id
  }
}

data "utils_deep_merge_yaml" "values" {
  input = [for i in concat(local.helm_values, var.helm_values) : yamlencode(i)]
}

# Reads the Istio ingress gateway Service (created by ArgoCD when the gateway
# Application syncs) to obtain its LoadBalancer IP. The IP is used to derive the
# nip.io domain for the gateway TLS certificate. `depends_on` defers the read to
# apply time, after the module has created the gateway Application.
data "kubernetes_resource" "istio_gateway" {
  api_version = "v1"
  kind        = "Service"

  metadata {
    name      = "istio-gateway-istio"
    namespace = "istio-ingress"
  }

  depends_on = [null_resource.dependencies]
}


resource "argocd_application" "gateway_certificate" {
  metadata {
    name      = var.destination_cluster != "in-cluster" ? "istio-gateway-certificate-${var.destination_cluster}" : "istio-gateway-certificate"
    namespace = var.argocd_namespace
    labels = merge({
      "application" = "istio-gateway-certificate"
      "cluster"     = var.destination_cluster
    }, var.argocd_labels)
  }

  timeouts {
    create = "5m"
    delete = "5m"
  }

  wait = var.app_autosync == { "allow_empty" = tobool(null), "prune" = tobool(null), "self_heal" = tobool(null) } ? false : true

  spec {
    project = var.argocd_project == null ? module.istio.argocd_project_name : var.argocd_project

    source {
      repo_url        = var.project_source_repo
      path            = "charts/gateway-certificate"
      target_revision = var.target_revision
      helm {
        values = data.utils_deep_merge_yaml.values.output
      }
    }

    destination {
      name      = var.destination_cluster
      namespace = "istio-ingress"
    }

    sync_policy {
      dynamic "automated" {
        for_each = toset(var.app_autosync == { "allow_empty" = tobool(null), "prune" = tobool(null), "self_heal" = tobool(null) } ? [] : [var.app_autosync])
        content {
          prune       = automated.value.prune
          self_heal   = automated.value.self_heal
          allow_empty = automated.value.allow_empty
        }
      }

      retry {
        backoff {
          duration     = "20s"
          max_duration = "2m"
          factor       = "2"
        }
        limit = "5"
      }

      sync_options = [
        "CreateNamespace=true",
      ]
    }
  }

  depends_on = [null_resource.dependencies]
}

resource "null_resource" "this" {
  depends_on = [argocd_application.gateway_certificate]
}
