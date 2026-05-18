locals {
  helm_values = [{
    istiod = {}
  }]

  gateway_ip     = data.kubernetes_service.istio_gateway.status[0].load_balancer[0].ingress[0].ip
  gateway_domain = "${trimprefix(var.subdomain, ".")}.${replace(local.gateway_ip, ".", "-")}.nip.io"
}
