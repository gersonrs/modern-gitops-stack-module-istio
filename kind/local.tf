locals {
  gateway_ip   = data.kubernetes_resource.istio_gateway.object.status.loadBalancer.ingress[0].ip
  gateway_name = format("%s.nip.io", replace(local.gateway_ip, ".", "-"))

  helm_values = [{
    gateway_certificate_config = {
      name           = "istio-gateway-tls"
      namespace      = "istio-ingress"
      cluster_issuer = var.cluster_issuer
      dns_names = [
        "*.${local.gateway_name}",
        "*.${var.subdomain}.${local.gateway_name}",
      ]
    }
  }]
}
