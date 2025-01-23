variable "fargate_profile_additional_policies" {
  type        = map(string)
  description = "Additional policies to be added to the IAM role."
}

# tflint-ignore: terraform_unused_declarations
variable "fargate_profile_namespace" {
  type        = string
  description = "Namespace to be used by the Fargate Profile."
}
variable "fargate_profile_name" {
  type        = string
  description = "Name of the Fargate Profile."
}

variable "fargate_profile_iam_role_name" {
  type        = string
  description = "Name of the IAM role for the Fargate Profile."
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name."
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs to launch Fargate Profiles in."
}

variable "fargate_profile_selectors" {
  description = "The selectors for the Fargate profile."
  type = list(object({
    namespace = string
    labels    = map(string)
  }))
}

variable "create_fargate_profile" {
  type        = bool
  description = "Whether to create a Fargate Profile."
}

variable "tags" {
  type        = map(string)
  description = "Map of tags for the resources."
}
