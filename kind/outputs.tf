output "id" {
  description = "ID to pass other modules in order to refer to this module as a dependency. It takes the ID that comes from the main module and passes it along to the code that called this variant in the first place."
  value       = module.istio.id
}

output "external_ip" {
  description = "External IP address of the Istio ingress gateway LoadBalancer service."
  value       = try(data.kubernetes_service.istio_gateway.status.0.load_balancer.0.ingress.0.ip, "127.0.0.1")
  depends_on  = [null_resource.istio_gateway_certificate]
}

output "gateway_name" {
  description = "Name of the Istio Gateway resource for use in HTTPRoute parentRefs."
  value       = module.istio.gateway_name
}

output "gateway_namespace" {
  description = "Namespace of the Istio Gateway resource for use in HTTPRoute parentRefs."
  value       = module.istio.gateway_namespace
}
