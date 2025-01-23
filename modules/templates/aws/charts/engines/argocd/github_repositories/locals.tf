locals {
  gitops_registry_yaml_path = "${path.module}/yamls/gitops-argocd-ssh.yaml"
  app_of_apps_yaml_path     = "${path.module}/yamls/app-of-apps.yaml"

  github_repository_name = var.create_github_repo ? github_repository.gitops_repo[0].name : var.github_repo
  ssh_clone_url          = var.create_github_repo ? github_repository.gitops_repo[0].ssh_clone_url : data.github_repository.gitops.ssh_clone_url
  private_key_openssh    = split("\n", tls_private_key.gitops_repository_generate_keys.private_key_openssh)

  gitops_registry_yaml = templatefile(local.gitops_registry_yaml_path, {
    namespace              = var.namespace
    github_repository_name = local.github_repository_name
    ssh_clone_url          = trimsuffix(local.ssh_clone_url, ".git")
    private_key_openssh    = local.private_key_openssh
  })

  app_of_apps_yaml = templatefile(local.app_of_apps_yaml_path, {
    namespace     = var.namespace
    ssh_clone_url = local.ssh_clone_url
    path          = var.apps_of_apps_path
    app_proj      = var.app_proj
  })
}
