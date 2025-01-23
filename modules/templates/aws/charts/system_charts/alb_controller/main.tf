module "alb_controller_irsa_role" {
  source           = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version          = "5.47.1"
  create_role      = var.create_role_enabled
  role_name_prefix = var.serviceaccount
  # role_path                              = "/${var.cluster_name}/${var.namespace}/"
  attach_load_balancer_controller_policy                          = true
  attach_load_balancer_controller_targetgroup_binding_only_policy = true

  oidc_providers = {
    ex = {
      provider_arn               = var.cluster_oidc_provider_arn
      namespace_service_accounts = ["${var.namespace}:${var.serviceaccount}"]
    }
  }
}

resource "helm_release" "alb_controller" {
  name             = var.name
  chart            = "aws-load-balancer-controller"
  repository       = "https://aws.github.io/eks-charts"
  create_namespace = var.namespace == "kube-system" ? false : true
  version          = var.chart_version
  namespace        = var.namespace
  values           = [local.base_values]
}
