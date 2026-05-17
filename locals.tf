locals {
  domain = var.base_domain != "" ? "${var.subdomain != "" ? "${trimprefix(var.subdomain, ".")}.": ""}${var.base_domain}" : ""

  helm_values = [{
    istiod = {
      profile = "ambient"
    }
    cni = {
      profile = "ambient"
    }
    gateway_config = {
      name           = "istio-gateway"
      domain         = local.domain
      cluster_issuer = var.cluster_issuer
    }
  }]
}
