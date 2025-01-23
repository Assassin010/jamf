variable "namespace" {
  type        = string
  description = "ArgoCD namespace"
}

variable "account_id" {
  type = string
}

variable "region" {
  type = string
}

variable "serviceaccount" {
  type        = string
  description = "Serviceaccount name to install the chart into"
  default     = "argocd"
}

variable "ecr_registry_name" {
  type        = string
  description = "ECR registry name on ARGOCD"
  default     = "ecr"
}

variable "ecr_role_name" {
  type        = string
  description = "ECR registry role name"
}

variable "cluster_oidc_issuer_url" {
  type        = string
  description = "EKS oidc issuer url"
}
