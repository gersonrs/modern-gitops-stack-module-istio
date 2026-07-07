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
  cluster                = var.cluster

  helm_values = concat(local.helm_values, var.helm_values)

  dependency_ids = var.dependency_ids
}

resource "kubernetes_manifest" "wait_for_istio_gateway" {
  depends_on = [module.istio]

  manifest = {
    apiVersion = "v1"
    kind       = "Service"
    metadata = {
      name      = "istio-gateway-istio"
      namespace = "istio-ingress"
    }
  }

  # Força o Terraform a apenas ler o recurso existente e esperar, sem tentar recriá-lo
  field_manager {
    force_conflicts = true
  }

  # Aguarda até que o campo do LoadBalancer seja preenchido com o IP
  wait {
    fields = {
      "status.loadBalancer.ingress" = "*"
    }
  }
}

resource "kubernetes_manifest" "istio_gateway_certificate" {
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "Certificate"
    metadata = {
      name      = "istio-gateway-tls"
      namespace = "istio-ingress"
    }
    spec = {
      secretName = "istio-gateway-tls"
      issuerRef = {
        name = var.cluster_issuer
        kind = "ClusterIssuer"
      }
      dnsNames = [
        "*.${local.gateway_domain}"
      ]
    }
  }

  depends_on = [kubernetes_manifest.wait_for_istio_gateway]
}
