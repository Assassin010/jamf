variable "name" {
  type        = string
  description = "Name of release"
  default     = "jenkins"
}

variable "namespace" {
  type        = string
  description = "Namespace name to deploy helm release"
  default     = "jenkins"
}

variable "chart_version" {
  type        = string
  description = "Helm chart to release"
  default     = "5.7.12"
}

variable "serviceaccount" {
  type        = string
  description = "Serviceaccount name"
  default     = "jenkins"
}

variable "cluster_name" {
  type        = string
  description = "Name of EKS cluster"
}

variable "cluster_oidc_provider_arn" {
  type        = string
  description = "EKS cluster OIDC provider ARN"
}

variable "domain_name" {
  type        = string
  description = "Roure53 hosted zone name"
}
variable "certificate_arn" {
  type        = string
  description = "ACM certificate ARN"
}
