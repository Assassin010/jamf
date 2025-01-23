resource "kubectl_manifest" "github-app-secrets" {
  yaml_body = local.github_sso_secret_argocd_yaml

  lifecycle {
    precondition {
      condition     = fileexists(local.github_sso_secret_yaml_path)
      error_message = " --> Error: Failed to find '${local.github_sso_secret_yaml_path}'. Exit terraform process."
    }
  }
}
