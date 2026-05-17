module "istio" {
  source = "../"

  cluster_name   = var.cluster_name
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

  helm_values = concat(local.helm_values, var.helm_values)

  dependency_ids = var.dependency_ids
}

data "kubernetes_service" "istio_gateway" {
  metadata {
    name      = replace(format("istio-gateway-istio%s", module.istio.id), module.istio.id, "")
    namespace = "istio-ingress"
  }
}
