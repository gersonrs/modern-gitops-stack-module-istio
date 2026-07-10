output "id" {
  description = "ID to pass other modules in order to refer to this module as a dependency."
  value       = resource.null_resource.this.id
}

output "external_ip" {
  description = "External IP address of the Istio ingress gateway LoadBalancer service."
  value       = try(local.gateway_ip, "127.0.0.1")
}

output "gateway_name" {
  description = "Name of the Istio Gateway resource for use in HTTPRoute parentRefs."
  value       = module.istio.gateway_name
}

output "gateway_namespace" {
  description = "Namespace of the Istio Gateway resource for use in HTTPRoute parentRefs."
  value       = module.istio.gateway_namespace
}
