locals {
  helm_values = [{
    istiod = {}
  }]

  gateway_ip      = try(data.kubernetes_service.istio_gateway.status[0].load_balancer[0].ingress[0].ip, "127.0.0.1")
  gateway_domain  = var.base_domain != "" ? "${var.subdomain != "" ? "${trimprefix(var.subdomain, ".")}." : ""}${var.base_domain}" : format("%s.nip.io", replace(local.gateway_ip, ".", "-"))
  kubectl_context = var.kubectl_context != "" ? var.kubectl_context : "kind-${var.cluster_name}"
}
