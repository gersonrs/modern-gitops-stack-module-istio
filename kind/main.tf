module "istio" {
  source = "../"

  cluster_name    = var.cluster_name
  subdomain       = var.subdomain
  cluster_issuer  = var.cluster_issuer
  argocd_project  = var.argocd_project
  argocd_labels   = var.argocd_labels
  kubectl_context = local.kubectl_context

  project_source_repo    = var.project_source_repo
  namespace              = var.namespace
  argocd_namespace       = var.argocd_namespace
  destination_cluster    = var.destination_cluster
  target_revision        = var.target_revision
  enable_service_monitor = var.enable_service_monitor
  app_autosync           = var.app_autosync

  helm_values = concat(local.helm_values, var.helm_values)

  dependency_ids = var.dependency_ids
}

data "kubernetes_service" "istio_gateway" {
  metadata {
    name      = replace(format("istio-gateway-istio%s", module.istio.id), module.istio.id, "")
    namespace = "istio-ingress"
  }
}

resource "null_resource" "istio_gateway_certificate" {
  triggers = {
    ip             = local.gateway_ip
    cluster_issuer = var.cluster_issuer
    domain         = local.gateway_domain
  }

  provisioner "local-exec" {
    environment = {
      KUBE_CONTEXT = local.kubectl_context
    }
    command = <<-EOT
until kubectl --context=$KUBE_CONTEXT get clusterissuer '${var.cluster_issuer}' 2>/dev/null; do
  echo "Aguardando ClusterIssuer ${var.cluster_issuer}..."
  sleep 5
done
kubectl --context=$KUBE_CONTEXT apply -f - <<'CERT'
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: istio-gateway-tls
  namespace: istio-ingress
spec:
  secretName: istio-gateway-tls
  issuerRef:
    name: ${var.cluster_issuer}
    kind: ClusterIssuer
  dnsNames:
    - "*.${local.gateway_domain}"
CERT
kubectl --context=$KUBE_CONTEXT wait --for=condition=Ready certificate/istio-gateway-tls -n istio-ingress --timeout=120s
EOT
  }

  depends_on = [data.kubernetes_service.istio_gateway]
}
