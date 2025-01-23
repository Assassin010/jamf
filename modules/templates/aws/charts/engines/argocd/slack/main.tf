resource "kubectl_manifest" "slack-app-secret" {
  yaml_body = local.slack_app_secret_yaml

  lifecycle {
    precondition {
      condition     = fileexists(local.slack_app_secret_yaml_path)
      error_message = " --> Error: Failed to find '${local.slack_app_secret_yaml_path}'. Exit terraform process."
    }
  }
}

module "labs_repository" {
  count              = var.slack_poc_enabled ? 1 : 0
  source             = "../github_repositories"
  namespace          = var.namespace
  github_org         = "kwatatshey"
  github_repo        = "labs-terraform"
  create_github_repo = false
}

resource "kubectl_manifest" "application" {
  count     = var.slack_poc_enabled ? 1 : 0
  yaml_body = file(local.application_yaml_path)

  depends_on = [
    module.labs_repository
  ]

  lifecycle {
    precondition {
      condition     = fileexists(local.application_yaml_path)
      error_message = " --> Error: Failed to find '${local.application_yaml_path}'. Exit terraform process."
    }
  }
}
