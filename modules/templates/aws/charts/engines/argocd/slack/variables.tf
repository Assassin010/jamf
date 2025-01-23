variable "namespace" {
  type = string
}

variable "awssm_secret_name" {
  type        = string
  description = "Name of AWSSM secret"
}

variable "argocd_slack_app_secret" {
  type        = string
  description = "Name of secret contains Slack app token"
  default     = "argocd-slack-app-secret"
}

variable "cluster_secret_store_ref_name" {
  type        = string
  description = "ClusterSecretStore name"
}

variable "slack_poc_enabled" {
  type        = bool
  default     = false
  description = "Whether to test your slack channel with ArgoCD notification"
}