# resource "helm_release" "loki_stack" {
#   count            = var.enabled ? 1 : 0
#   name             = var.name
#   chart            = "loki-stack"
#   repository       = "https://grafana.github.io/helm-charts"
#   create_namespace = var.namespace == "kube-system" ? false : true
#   version          = var.chart_version
#   namespace        = var.namespace
#   values           = [local.base_values]

#   dynamic "set" {
#     for_each = var.extra_values
#     content {
#       name  = set.key
#       value = set.value
#     }
#   }
# }


resource "helm_release" "prometheus" {
  name             = "prometheus"
  namespace        = var.namespace
  chart            = "kube-prometheus-stack"
  version          = var.kube_prometheus_stack_version
  repository       = "https://prometheus-community.github.io/helm-charts"
  create_namespace = var.namespace == "prometheus" ? false : true
  values           = [local.base_values]

  dynamic "set" {
    for_each = var.extra_values
    content {
      name  = set.key
      value = set.value
    }
  }
}

