locals {

  values_yaml_path      = "${path.module}/yamls/values.yaml"
  app_project_yaml_path = "${path.module}/yamls/app-project.yaml"

  ecr_role_name = "ecr-role-${var.cluster_name}"
  ecr_role_arn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${local.ecr_role_name}"

  argocd_sso_enabled         = var.sso_enabled && var.github_admins_team != "" && var.awssm_sso_secret_name != ""
  argocd_slack_enabled       = var.argocd_slack_enabled && var.awssm_slack_secret_name != "" && var.argocd_slack_channel != ""
  argo_workflows_sso_enabled = local.argocd_sso_enabled && var.argo_workflows_sso_enabled
  separate_namespaces        = var.namespace != var.argo_workflows_namespace

  argocd_values = templatefile(local.values_yaml_path, {
    sa_name                        = var.serviceaccount
    release_name                   = var.release_name
    hostname                       = var.hostname
    ecr_reg_enabled                = var.ecr_reg_enabled
    ecr_role_arn                   = local.ecr_role_arn
    sso_enabled                    = local.argocd_sso_enabled
    github_org                     = var.github_org
    github_admins_team             = var.github_admins_team
    argocd_github_sso_secret       = var.argocd_github_sso_secret
    argocd_slack_enabled           = local.argocd_slack_enabled
    argocd_slack_app_secret        = var.argocd_slack_app_secret
    argocd_slack_channel           = var.argocd_slack_channel
    possitive_feedback             = var.possitive_feedback
    negative_feedback              = var.negative_feedback
    argo_workflows_sso_enabled     = var.argo_workflows_sso_enabled
    argo_workflows_hostname        = var.argo_workflows_hostname
    argo_rollouts_extension_enable = var.argo_rollouts_extension_enable
    extension_url                  = var.extension_url
  })

  app_project_yaml = templatefile(local.app_project_yaml_path, {
    namespace    = var.namespace
    github_org   = var.github_org != "" ? var.github_org : ""
    ecr_registry = var.ecr_reg_enabled ? module.ecr_registry[0].ecr_url : ""
  })
}
