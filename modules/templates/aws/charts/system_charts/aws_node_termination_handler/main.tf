resource "helm_release" "aws_nth" {
  name             = var.name
  chart            = "aws-node-termination-handler"
  repository       = "https://aws.github.io/eks-charts"
  create_namespace = var.namespace == "kube-system" ? false : true
  version          = var.chart_version
  namespace        = var.namespace
  values           = [local.base_values]

  dynamic "set" {
    for_each = var.extra_values
    content {
      name  = set.key
      value = set.value
    }
  }
}
