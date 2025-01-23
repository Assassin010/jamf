# Helm Cert Manager
resource "helm_release" "cert_manager" {
  name             = "cert-manager"
  chart            = "cert-manager"
  repository       = "https://charts.jetstack.io"
  version          = var.cert_manager_helm_chart_version
  namespace        = var.namespace
  create_namespace = true

  set {
    name  = "installCRDs"
    value = true
  }
  set {
    name  = "serviceAccount.create"
    value = true
  }
  set {
    name  = "serviceAccount.name"
    value = "cert-manager"
  }
  set {
    name  = "prometheus.enabled"
    value = false
  }
  set {
    name  = "webhook.mutatingWebhookConfigurationAnnotations.cert-manager\\.io/inject-ca-from"
    value = "cert-manager/dummy-certificate"
  }
}
