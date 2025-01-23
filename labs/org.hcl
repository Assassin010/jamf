locals {
  my_org = basename(get_terragrunt_dir())

  # GitHub organization for ArgoCD SSO.
  github_org = "kwatatshey"

  # Github team where all ArgoCD admin users are located.
  github_argocd_admins_team = "argocd-admins"

  # GitHub repositories to connect ArgoCD.
  github_repos = [
    #   "pods",
    #   "gitops",
    #   "tst-nginx-repo"
  ]
  # For source code bucket prefix 
  github_module_repo = "labs-terraform-modules"
}
