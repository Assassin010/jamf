module "cluster_autoscaler_irsa_role" {
  source                           = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version                          = "5.10.0"
  create_role                      = var.enabled
  role_name_prefix                 = var.serviceaccount
  role_path                        = "/${var.cluster_name}/${var.namespace}/"
  attach_cluster_autoscaler_policy = true
  cluster_autoscaler_cluster_ids   = [var.cluster_name]

  oidc_providers = {
    main = {
      provider_arn               = var.cluster_oidc_provider_arn
      namespace_service_accounts = ["${var.namespace}:${var.serviceaccount}"]
    }
  }
}

resource "helm_release" "cas" {
  count            = var.enabled ? 1 : 0
  name             = var.name
  chart            = "cluster-autoscaler"
  repository       = "https://kubernetes.github.io/autoscaler"
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

