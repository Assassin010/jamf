variable "name" {
  type        = string
  description = "Name of release"
  default     = "metrics-server"
}

variable "namespace" {
  type        = string
  description = "Namespace name to deploy helm release"
  default     = "kube-system"
}

variable "chart_version" {
  type        = string
  description = "Helm chart to release"
  default     = "3.12.2"
}

# tflint-ignore: terraform_unused_declarations
variable "enabled" {
  type        = bool
  description = "Enable or not chart as a component"
  default     = false
}

variable "serviceaccount" {
  type        = string
  description = "Serviceaccount name"
  default     = "metrics-server"
}

variable "cluster_name" {
  type        = string
  description = "Name of EKS cluster"
}
