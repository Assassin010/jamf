resource "helm_release" "kyverno" {
  name             = "kyverno"
  repository       = "https://kyverno.github.io/kyverno/"
  chart            = "kyverno"
  version          = "3.3.4"
  create_namespace = true
  namespace        = "kyverno"
  set {
    name  = "admissionController.replicas"
    value = "3"
  }

  set {
    name  = "backgroundController.replicas"
    value = "2"
  }

  set {
    name  = "cleanupController.replicas"
    value = "2"
  }

  set {
    name  = "reportsController.replicas"
    value = "2"
  }
  // Omitting namespace to install Kyverno cluster-wide
  // namespace = "kyverno"
}

resource "helm_release" "kyverno_policies" {
  depends_on = [helm_release.kyverno]
  name       = "kyverno-policies"
  repository = "https://kyverno.github.io/kyverno/"
  chart      = "kyverno-policies"
  version    = "3.3.2"
  namespace  = "kyverno" # Make sure to deploy in the same namespace as Kyverno
  # Add any additional attributes or values here if needed
}
