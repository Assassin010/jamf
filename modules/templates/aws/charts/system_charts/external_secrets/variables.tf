variable "name" {
  type        = string
  description = "Name of release"
  default     = "external-secrets"
}

variable "namespace" {
  type        = string
  description = "Namespace name to deploy helm release"
  default     = "kube-system"
}

variable "chart_version" {
  type        = string
  description = "Helm chart to release"
  default     = "0.10.5"
}

variable "serviceaccount" {
  type        = string
  description = "Serviceaccount name"
  default     = "external-secrets"
}

variable "cluster_oidc_provider_arn" {
  type        = string
  description = "EKS cluster OIDC provider ARN"
}

variable "ssm_parameter_arns" {
  type        = list(string)
  description = "SSM parameter ARNS"
  default     = ["arn:aws:ssm:*:*:parameter/*"]
}

variable "secrets_manager_arns" {
  type        = string
  description = "secrets manager ARNS"
  default     = "arn:aws:secretsmanager:%s:%s:secret:%s"
}

variable "secrets_regex" {
  type        = string
  description = "AWS SM Secrets regex for ARN"
  default     = "*"
}

variable "region" {
  type        = string
  description = "AWS region where the ASG placed"
}

variable "timeout" {
  type        = number
  description = "Timeout for the helm release"
  default     = 600
}
