locals {
  helm_values = [{
    istiod = {}
  }]

  gateway_ip = data.kubernetes_resource.istio_gateway.object.status.loadBalancer.ingress[0].ip

  # Base domain: uses the provided base_domain, otherwise derives a nip.io domain from the gateway LoadBalancer IP.
  gateway_base = var.base_domain != "" ? var.base_domain : format("%s.nip.io", replace(local.gateway_ip, ".", "-"))

  # Full domain used by the services' HTTPRoutes, e.g. "apps.172-18-0-100.nip.io".
  gateway_domain = var.subdomain != "" ? "${trimprefix(var.subdomain, ".")}.${local.gateway_base}" : local.gateway_base
}
