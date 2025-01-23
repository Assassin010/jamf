variable "create_github_repo" {
  type        = bool
  description = "Creare a new GitOps repository"
}

variable "github_org" {
  type        = string
  description = "GitOps repository organization"
  default     = ""
}

variable "github_repo" {
  type        = string
  description = "Github repository name"
}

variable "github_main_branch" {
  type        = string
  description = "GitOps repository main branch"
  default     = "main"
}

variable "apps_of_apps_path" {
  type        = string
  description = "Path to all application Yamls in GitOps repository"
  default     = "applications"
}

variable "namespace" {
  type        = string
  description = "ArgoCD namespace"
  default     = "argocd"
}

variable "github_ssh_public_key_name" {
  type        = string
  description = "Deploy key name on GitHub, where the public key is stored"
  default     = "argocd"
}

variable "app_proj" {
  type        = string
  description = "name of argocd application project"
  default     = "main-proj"
}