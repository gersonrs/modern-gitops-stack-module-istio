locals {
  helm_values = [{
    istiod = {}
  }]

  gateway_domain  = var.base_domain != "" ? "${var.subdomain != "" ? "${trimprefix(var.subdomain, ".")}." : ""}${var.base_domain}" : "${var.subdomain != "" ? trimprefix(var.subdomain, ".") : "apps"}.nip.io"
  kubectl_context = var.kubectl_context != "" ? var.kubectl_context : "kind-${var.cluster_name}"
}
