locals {
  helm_values = [{
    istiod = {}
  }]

  gateway_ip      = try(data.kubernetes_service.istio_gateway.status[0].load_balancer[0].ingress[0].ip, "127.0.0.1")
  gateway_domain  = "${trimprefix(var.subdomain, ".")}.${replace(local.gateway_ip, ".", "-")}.nip.io"
  kubectl_context = var.kubectl_context != "" ? var.kubectl_context : "kind-${var.cluster_name}"
}
