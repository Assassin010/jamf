locals {
  application_yaml_path      = "${path.module}/slack_poc/application.yaml"
  slack_app_secret_yaml_path = "${path.module}/yamls/slack-app-secret.yaml"

  slack_app_secret_yaml = templatefile(local.slack_app_secret_yaml_path, {
    awssm_secret_name       = var.awssm_secret_name
    argocd_slack_app_secret = var.argocd_slack_app_secret
    namespace               = var.namespace
    secret_store_ref_name   = var.cluster_secret_store_ref_name
  })
}