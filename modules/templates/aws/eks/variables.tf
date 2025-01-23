variable "vpc_id" {
  type    = string
  default = "The ID of the VPC."
}

variable "public_subnet_ids" {
  type        = list(string)
  default     = []
  description = "List of subnet IDs for the EKS Node Group."
}

variable "private_subnet_ids" {
  type        = list(string)
  default     = []
  description = "List of subnet IDs for the EKS Node Group."
}

variable "cluster_name" {
  type        = string
  default     = "value"
  description = "The name of the EKS cluster."
}

variable "kubernets_version" {
  type        = string
  default     = ""
  description = "The Kubernetes version for the EKS cluster."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "The tags to apply to the resources"
}

variable "node_security_group_tags" {
  type        = map(string)
  default     = {}
  description = "The tags to apply to the node security group."
}

variable "r53_subzone_name" {
  type        = string
  default     = ""
  description = "Route53 subzone name"
}

variable "r53_hosted_zone_name" {
  type        = string
  default     = ""
  description = "Route53 hosted zone name"
}

variable "worker_nodes_kms_key_aliases" {
  type        = list(string)
  default     = []
  description = "List of aliases for the KMS key"
}
variable "create_fargate_profile" {
  type        = bool
  description = "Whether to create a Fargate Profile."
  default     = false
}

variable "fargate_profiles" {
  type = map(object({
    name          = string
    namespace     = string
    iam_role_name = string
    selectors = list(object({
      namespace = string
      labels    = map(string)
    }))
    additional_policies = map(string)
  }))
  description = "Map of Fargate profiles to create."
  default     = {}
}

# create some variables
variable "nodegroup_subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for the EKS Node Group."
  default     = []
}

variable "oic_role_configurations" {
  description = "values for the OIDC role configurations."
  type = map(object({
    role_name           = string
    assume_role_actions = list(string)
    namespace           = string
    service_account     = string
    policy_file         = string
  }))
  default = {
    "name" = {
      role_name           = "value"
      assume_role_actions = ["value"]
      namespace           = "value"
      service_account     = "value"
      policy_file         = "value"
    }
  }
}

variable "enable_creation_role_with_oidc" {
  type        = bool
  description = "Enable creation of IAM roles with OIDC."
  default     = false
}

variable "iam_node_group_role" {
  type        = string
  description = "The name of the IAM role to attach to the EKS managed node group."
  default     = "value"
}


variable "create_managed_node_groups" {
  type        = bool
  description = "Whether to create a managed node group."
  default     = false
}

variable "eks_managed_node_groups" {
  description = "values for the EKS managed node groups."
  type = map(object({
    ami_type       = string
    min_size       = number
    max_size       = number
    desired_size   = number
    instance_types = list(string)
    capacity_type  = string
    # use_custom_launch_template = bool
    # disk_size                  = number
    network_interfaces = list(object({
      delete_on_termination       = bool
      associate_public_ip_address = bool
    }))
  }))
  default = {
    "name" = {
      ami_type       = "value"
      capacity_type  = "value"
      desired_size   = 0
      instance_types = ["value"]
      max_size       = 0
      min_size       = 0
      network_interfaces = [{
        associate_public_ip_address = false
        delete_on_termination       = false
      }]
    }
  }
}

variable "autoscaling_average_cpu" {
  type        = number
  description = "Average CPU threshold to autoscale EKS EC2 instances."
  default     = 0
}

variable "iam_role_nodes_additional_policies" {
  type        = map(string)
  description = "List of additional IAM policies to attach to EKS managed node groups."
  default     = {}
}

variable "node_add_policy_name" {
  type        = string
  description = "Name of the policy to attach to the EKS managed node group."
  default     = "value"
}


variable "developer_user_group" {
  type        = string
  description = "Name of the kube group for developers."
  default     = "value"
}

variable "kubernetes_groups" {
  type        = string
  description = "Name of the Kubernetes group."
  default     = "value"
}

variable "developer_roles" {
  type        = list(string)
  description = "List of Kubernetes developer roles."
  default     = []
}

variable "developer_users" {
  type        = list(string)
  description = "List of Kubernetes developers."
  default     = []
}

variable "addons" {
  description = "List of EKS addons"
  type = list(object({
    addon_name               = string
    addon_version            = optional(string, "")
    service_account_role_arn = optional(string, "")
  }))
}

variable "enable_eks_addons" {
  description = "Flag to enable or disable EKS addons"
  type        = bool
  default     = true
}
