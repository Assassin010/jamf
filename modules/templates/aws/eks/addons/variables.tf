variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "addons" {
  description = "List of EKS addons"
  type = list(object({
    addon_name               = string
    addon_version            = optional(string, "")
    service_account_role_arn = optional(string, "")
  }))
  default = []
}

variable "enable_eks_addons" {
  description = "Flag to enable or disable EKS addons"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
