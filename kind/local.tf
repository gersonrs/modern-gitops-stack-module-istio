locals {
  helm_values = [{
    istiod = {}
  }]

  gateway_ip     = resource.kubernetes_manifest.wait_for_istio_gateway.object.status.loadBalancer.ingress[0].ip
  gateway_domain = format("%s.nip.io", replace(local.gateway_ip, ".", "-"))
}
