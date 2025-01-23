module "external_secrets_irsa_role" {
  source                                = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version                               = "5.10.0"
  create_role                           = true
  role_name_prefix                      = var.serviceaccount
  attach_external_secrets_policy        = true
  external_secrets_ssm_parameter_arns   = var.ssm_parameter_arns
  external_secrets_secrets_manager_arns = formatlist(var.secrets_manager_arns, var.region, data.aws_caller_identity.current.account_id, var.secrets_regex)

  oidc_providers = {
    ex = {
      provider_arn               = var.cluster_oidc_provider_arn
      namespace_service_accounts = ["${var.namespace}:${var.serviceaccount}"]
    }
  }
}

resource "helm_release" "external_secrets" {
  name             = var.name
  chart            = "external-secrets"
  repository       = "https://charts.external-secrets.io"
  create_namespace = var.namespace != "kube-system"
  version          = var.chart_version
  namespace        = var.namespace
  timeout          = var.timeout

  values = [
    local.external_secrets_values_yaml
  ]

  depends_on = [
    module.external_secrets_irsa_role
  ]

  lifecycle {
    precondition {
      condition     = fileexists(local.values_yaml_path)
      error_message = " --> Error: Failed to find '${local.values_yaml_path}'. Exit terraform process."
    }
  }
}

resource "kubectl_manifest" "cluster-secret-store" {
  yaml_body = local.cluster_secret_store_yaml

  depends_on = [
    helm_release.external_secrets
  ]

  lifecycle {
    precondition {
      condition     = fileexists(local.cluster_secret_store_yaml_path)
      error_message = " --> Error: Failed to find '${local.cluster_secret_store_yaml_path}'. Exit terraform process."
    }
  }
}
