locals {
  gateway_ip = data.kubernetes_resource.istio_gateway.object.status.loadBalancer.ingress[0].ip

  # Domain used for the gateway TLS certificate SANs. Kept deterministic during
  # bootstrap: it must not depend on data sources that only exist after the
  # module runs, otherwise Terraform reports a dependency cycle.
  gateway_certificate_domain = var.base_domain != "" ? var.base_domain : "127-0-0-1.nip.io"

  helm_values = [{
    gateway_certificate_config = {
      name           = "istio-gateway-tls"
      namespace      = "istio-ingress"
      cluster_issuer = var.cluster_issuer
      dns_names = [
        "*.${local.gateway_certificate_domain}",
        "*.${var.subdomain}.${local.gateway_certificate_domain}",
      ]
    }
  }]
}
