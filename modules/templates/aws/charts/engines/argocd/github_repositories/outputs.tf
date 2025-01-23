output "ssh_clone_url" {
  value = var.create_github_repo ? github_repository.gitops_repo[0].ssh_clone_url : data.github_repository.gitops.ssh_clone_url
}