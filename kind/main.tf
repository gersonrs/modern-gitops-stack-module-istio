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

  depends_on = [module.istio]
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
        "*.${local.gateway_domain}",
        "*.${local.gateway_base}",
      ]
    }
  }

  depends_on = [data.kubernetes_resource.istio_gateway]
}
