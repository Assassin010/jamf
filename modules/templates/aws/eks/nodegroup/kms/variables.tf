variable "worker_nodes_kms_key_aliases" {
  type        = list(string)
  description = "List of aliases for the KMS key"
  default     = []
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "The tags to apply to the resources"
}

variable "cluster_iam_role_arn" {
  type        = string
  default     = ""
  description = "The ARN of the IAM role for the EKS cluster"
}
