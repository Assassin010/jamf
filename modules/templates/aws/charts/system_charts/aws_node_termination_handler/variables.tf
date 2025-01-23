variable "name" {
  type        = string
  description = "Name of release"
  default     = "aws-node-termination-handler"
}

variable "namespace" {
  type        = string
  description = "Namespace name to deploy helm release"
  default     = "kube-system"
}

variable "chart_version" {
  type        = string
  description = "Helm chart to release"
  default     = "0.21.0"
}

variable "extra_values" {
  type        = map(any)
  description = "Extra values in key value format"
  default     = {}
}

variable "serviceaccount" {
  type        = string
  description = "Serviceaccount name"
  default     = "aws-node-termination-handler"
}

variable "cluster_name" {
  type        = string
  description = "Name of EKS cluster"
}
