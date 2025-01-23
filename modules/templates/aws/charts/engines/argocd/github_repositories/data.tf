data "github_user" "current" {
  username = ""
}

data "github_repository" "gitops" {
  full_name = "${var.github_org}/${var.github_repo}"
}