locals {
  github_sso_secret_yaml_path = "${path.module}/yamls/github-sso-secret.yaml"
  github_sso_secret_argocd_yaml = templatefile(local.github_sso_secret_yaml_path, {
    awssm_secret_name        = var.awssm_secret_name
    argocd_github_sso_secret = var.argocd_github_sso_secret
    namespace                = var.namespace
    secret_store_ref_name    = var.cluster_secret_store_ref_name
  })
}
