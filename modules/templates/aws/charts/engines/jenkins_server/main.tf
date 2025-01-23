module "jenkins_irsa_role" {
  source                                 = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version                                = "5.44.2"
  create_role                            = true
  role_name_prefix                       = var.serviceaccount
  role_path                              = "/${var.cluster_name}/${var.namespace}/"
  attach_load_balancer_controller_policy = true

  oidc_providers = {
    ex = {
      provider_arn               = var.cluster_oidc_provider_arn
      namespace_service_accounts = ["${var.namespace}:${var.serviceaccount}"]
    }
  }
}

resource "helm_release" "jenkins" {
  name             = var.name
  chart            = "jenkins"
  repository       = "https://charts.jenkins.io"
  create_namespace = var.namespace == "kube-system" ? false : true
  version          = var.chart_version
  namespace        = var.namespace
  values           = [local.base_values]
  timeout          = 600

  depends_on = [module.jenkins_irsa_role]
}
