output "id" {
  description = "ID to pass other modules in order to refer to this module as a dependency."
  value       = resource.null_resource.this.id
}

output "gateway_name" {
  description = "Name of the Istio Gateway resource for use in HTTPRoute parentRefs."
  value       = "istio-gateway"
}

output "gateway_namespace" {
  description = "Namespace of the Istio Gateway resource for use in HTTPRoute parentRefs."
  value       = "istio-ingress"
}
output "argo_project_name" {
  description = "Name of the ArgoCD project."
  value       = var.argocd_project == null ? argocd_project.this[0].metadata.0.name : var.argocd_project
}
