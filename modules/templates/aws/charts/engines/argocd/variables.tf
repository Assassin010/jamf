# General
variable "release_name" {
  type        = string
  description = "Name of release"
}
variable "region" {
  type = string
}
variable "cluster_name" {
  type = string
}
variable "chart_name" {
  type        = string
  description = "Name of the chart to install"
  default     = "argo-cd"
}
variable "chart_version" {
  type        = string
  description = "Version of the chart to install"
  default     = "7.7.0"
}
variable "repository" {
  type        = string
  description = "Repository to install the chart from"
  default     = "https://argoproj.github.io/argo-helm"
}
variable "namespace" {
  type        = string
  description = "Namespace to install the chart into"
}
variable "serviceaccount" {
  type        = string
  description = "Serviceaccount name to install the chart into"
  default     = "argocd"
}

# tflint-ignore: terraform_unused_declarations
variable "create_namespace" {
  type        = bool
  description = "Create the namespace if it does not exist"
  default     = true
}
variable "recreate_pods" {
  type        = bool
  description = "Recreate pods in the deployment if necessary"
  default     = true
}
variable "timeout" {
  type        = number
  description = "Timeout for the helm release"
  default     = 3000
}
variable "hostname" {
  type        = string
  description = "Hostname of argocd"
}

# ECR registry
variable "ecr_reg_enabled" {
  type        = bool
  description = "Whether sync ArgoCD to ECR registry"
  default     = false
}
variable "cluster_oidc_issuer_url" {
  type        = string
  description = "cluster_oidc_issuer_url"
}

# GitOps repository
variable "gitops_repo_enabled" {
  type        = bool
  description = "Whether sync ArgoCD to GitOps repository"
  default     = false
}
variable "github_org" {
  type        = string
  description = "GitOps repository organization"
  default     = ""
}
variable "gitops_repo" {
  type        = string
  description = "GitOps repository name"
  default     = "gitops"
}

# Microservices repositories
variable "github_repositories_enabled" {
  type        = bool
  description = "Connect repositories to ArgoCD"
  default     = false
}
variable "github_repositories" {
  type    = list(string)
  default = []
}

# ArgoCD GitHub SSO
variable "sso_enabled" {
  type        = bool
  description = "Whether to use ArgoCD SSO"
  default     = false
}
variable "github_admins_team" {
  type        = string
  description = "Name of ArgoCD admins-team on GitHub"
  default     = "argocd-admins"
}
variable "awssm_sso_secret_name" {
  type        = string
  description = "Name of AWSSM secret"
}
variable "argocd_github_sso_secret" {
  type        = string
  description = "Name of secret contains GitHub app credentials"
}
variable "cluster_secret_store_ref_name" {
  type        = string
  description = "ClusterSecretStore name"
}

# ArgoCD Slack Channel
variable "argocd_slack_enabled" {
  type        = bool
  default     = false
  description = "Whether to connect ArgoCD to Slack channel"
}
variable "argocd_slack_channel" {
  type        = string
  default     = "argocd-channel"
  description = "Name of ArgoCD admins-team on GitHub"
}
variable "awssm_slack_secret_name" {
  type        = string
  default     = "argocd-slack-app-token"
  description = "Name of AWSSM secret where slack token is stored"
}
variable "argocd_slack_app_secret" {
  type        = string
  description = "Name of secret contains Slack app token"
  default     = "argocd-notifications-secret"
}
variable "possitive_feedback" {
  type        = bool
  default     = false
  description = "Whether to get possitive notifications from ArgoCD"
}
variable "negative_feedback" {
  type        = bool
  default     = true
  description = "Whether to get negattive notifications from ArgoCD"
}
variable "slack_poc_enabled" {
  type        = bool
  default     = false
  description = "Whether to test your slack channel with ArgoCD notification"
}

# Argo-Workflows GitHub SSO
variable "argo_workflows_sso_enabled" {
  type        = bool
  default     = false
  description = "Whether to add argo-workflows to argocd dex"
}
variable "argo_workflows_hostname" {
  type        = string
  description = "Argo-Workflows hostname"
}
variable "argo_workflows_namespace" {
  type        = string
  description = "Argo-Workflows namespace"
}

# Argo-Rollouts Extension for ArgoCD
variable "argo_rollouts_extension_enable" {
  type        = bool
  default     = false
  description = "Whether to install Argo-Rollouts extension for ArgoCD"
}
variable "extension_url" {
  type        = string
  default     = "https://github.com/argoproj-labs/rollout-extension/releases/download/v0.3.5/extension.tar"
  description = "Argo-Rollouts extension package"
}
