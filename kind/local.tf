locals {
  gateway_ip  = data.kubernetes_resource.istio_gateway.object.status.loadBalancer.ingress[0].ip
  base_domain = format("%s.nip.io", replace(gateway_ip, ".", "-"))

  helm_values = [{
    gateway_certificate_config = {
      name           = "istio-gateway-tls"
      namespace      = "istio-ingress"
      cluster_issuer = var.cluster_issuer
      dns_names = [
        "*.${local.base_domain}",
        "*.${var.subdomain}.${local.base_domain}",
      ]
    }
  }]
}
