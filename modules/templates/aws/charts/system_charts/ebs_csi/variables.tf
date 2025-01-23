variable "name" {
  type        = string
  description = "Name of release"
  default     = "ebs-csi"
}

variable "namespace" {
  type        = string
  description = "Namespace name to deploy helm release"
  default     = "kube-system"
}

variable "chart_version" {
  type        = string
  description = "Helm chart to release"
  default     = "2.36.0"
}

variable "serviceaccount" {
  type        = string
  description = "Serviceaccount name"
  default     = "ebs-csi"
}

variable "cluster_oidc_provider_arn" {
  type        = string
  description = "EKS cluster OIDC provider ARN"
}

variable "region" {
  type        = string
  description = "AWS region where the ASG placed"
}

