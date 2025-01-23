variable "cluster_name" {
  type        = string
  description = "EKS cluster name."
}


variable "name" {
  type        = string
  description = "The name of the EKS managed node group."
}

variable "ami_type" {
  type        = string
  description = "The type of AMI to use for the EKS managed node group."
}

variable "min_size" {
  type        = number
  description = "Minimum number of nodes in the EKS managed node group."
}

variable "max_size" {
  type        = number
  description = "Maximum number of nodes in the EKS managed node group."
}
variable "desired_size" {
  type        = number
  description = "Desired number of nodes in the EKS managed node group."
}
variable "instance_types" {
  type        = list(string)
  description = "List of instance types to use for the EKS managed node group."
}

variable "capacity_type" {
  type        = string
  description = "Capacity type for the EKS managed node group."
}
# variable "use_custom_launch_template" {}
# variable "disk_size" {}
variable "network_interfaces" {
  type = list(object({
    associate_public_ip_address = bool
    delete_on_termination       = bool
    # description                 = string
    # device_index                = number
    # security_groups              = list(string)
    # subnet_id                   = string
  }))
  description = "List of network interfaces to attach to the EKS managed node group."
}

variable "eks_managed_node_groups" {
  description = "values for the EKS managed node groups."
  type = map(object({
    ami_type       = string
    min_size       = number
    max_size       = number
    desired_size   = number
    instance_types = list(string)
    # tags           = optional(map(string), {}) # Default to an empty map
    capacity_type = string
    # use_custom_launch_template = bool
    # disk_size                  = number
    network_interfaces = list(object({
      delete_on_termination       = bool
      associate_public_ip_address = bool
    }))
  }))
}

# variable "eks_managed_node_groups" {}
variable "ebs_kms_key_arn" {
  type        = string
  description = "The ARN of the KMS key to use for EBS encryption."
}

variable "tag_specifications" {
  type        = list(string)
  description = "List of tag specifications to apply to the EKS managed node group."
}
variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources."
}

# variable "cluster_iam_role_arn" {}




variable "nodegroup_subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs to launch the EKS managed node group in."
}

variable "cluster_version" {
  type        = string
  description = "The Kubernetes server version for the EKS cluster."
}



variable "autoscaling_average_cpu" {
  type        = number
  description = "Average CPU threshold to autoscale EKS EC2 instances."
}

variable "cluster_service_cidr" {
  type        = string
  description = "CIDR block for the EKS cluster service."
}



variable "iam_role_nodes_additional_policies" {
  type        = map(string)
  description = "List of additional IAM policies to attach to EKS managed node groups."
}

variable "cluster_primary_security_group_id" {
  type        = string
  description = "Cluster security group that was created by Amazon EKS for the cluster. Managed node groups use this security group for control-plane-to-data-plane communication. Referred to as 'Cluster security group' in the EKS console"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "List of security group IDs to attach to the EKS cluster."
}

variable "iam_node_group_role" {
  type        = string
  description = "The name of the IAM role to attach to the EKS managed node group."
}

# variable "node_group_name" {
#   type        = string
#   description = "The name of the EKS managed node group."
# }

variable "create_managed_node_groups" {
  type        = bool
  description = "Whether to create a managed node group."
}

variable "node_add_policy_name" {
  type        = string
  description = "The name of the additional policy to attach to the EKS managed node group."
}
