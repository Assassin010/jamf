resource "github_repository" "gitops_repo" {
  count       = var.create_github_repo ? 1 : 0
  name        = var.github_repo
  description = "App Of Apps - ArgoCD GitOps repository. Created by Terraform."
  visibility  = "private"
  auto_init   = true
}

#resource "github_repository_file" "app_of_apps_yaml" {
#  count          = var.create_github_repo ? 1 : 0
#  repository     = github_repository.gitops_repo[0].name
#  branch         = var.gitops_main_branch
#  file           = "app-of-apps.yaml"
#  commit_message = "Adding app-of-apps yaml."
#  content        = local.app_of_apps_yaml
#}

resource "github_repository_file" "applications_directory" {
  count          = var.create_github_repo ? 1 : 0
  repository     = github_repository.gitops_repo[0].name
  branch         = var.github_main_branch
  file           = "${var.apps_of_apps_path}/ReadMe.md"
  content        = "- Store all ArgoCD application.yaml files here."
  commit_message = "Adding ${var.apps_of_apps_path} directory for all ArgoCD application yamls"
}

resource "github_repository_file" "codeowners" {
  count          = var.create_github_repo ? 1 : 0
  repository     = github_repository.gitops_repo[0].name
  branch         = var.github_main_branch
  file           = ".github/CODEOWNERS"
  commit_message = "Adding CODEOWNERS file"
  content        = "* @${data.github_user.current.login}"
}

# Currently only supported GitHub public repository
#
#resource "github_branch_protection" "branch_protection" {
#  count = var.gitops_repo_create_new ? 1 : 0
#
#  repository_id = github_repository.gitops_repo[0].name
#  pattern = var.gitops_main_branch
#  require_conversation_resolution = true
#
#  required_pull_request_reviews {
#    required_approving_review_count = 1
#    require_code_owner_reviews = true
#  }
#}

resource "tls_private_key" "gitops_repository_generate_keys" {
  algorithm = "ED25519"
}

resource "github_repository_deploy_key" "gitops_repository_deploy_public_key" {
  title      = "${var.github_ssh_public_key_name}-${local.github_repository_name}"
  repository = local.github_repository_name
  key        = replace(tls_private_key.gitops_repository_generate_keys.public_key_openssh, "\n", "")
  read_only  = true
}

resource "kubectl_manifest" "gitops_repository" {
  yaml_body = local.gitops_registry_yaml

  sensitive_fields = [
    "stringData.sshPrivateKey"
  ]

  depends_on = [
    github_repository_deploy_key.gitops_repository_deploy_public_key
  ]

  lifecycle {
    precondition {
      condition     = fileexists(local.gitops_registry_yaml_path)
      error_message = " --> Error: Failed to find '${local.gitops_registry_yaml_path}'. Exit terraform process."
    }
  }
}

resource "kubectl_manifest" "app_of_apps" {
  count     = var.create_github_repo ? 1 : 0
  yaml_body = local.app_of_apps_yaml

  depends_on = [
    kubectl_manifest.gitops_repository
  ]

  lifecycle {
    precondition {
      condition     = fileexists(local.app_of_apps_yaml_path)
      error_message = " --> Error: Failed to find '${local.app_of_apps_yaml_path}'. Exit terraform process."
    }
  }
}
