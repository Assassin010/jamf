variable "vpc_id" {
  type        = string
  description = "The VPC ID to host the cluster in"
  default     = "value"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "The public subnet IDs to host the cluster in"
  default     = []
}

variable "private_subnet_ids" {
  type        = list(string)
  default     = []
  description = "The private subnet IDs to host the cluster in"
}

variable "cluster_name" {
  type        = string
  default     = ""
  description = "The name of the cluster"
}

variable "kubernets_version" {
  type        = string
  default     = ""
  description = "The version of Kubernetes"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "The tags to apply to the resources"
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

variable "security_alb_ingress_security_group_id" {
  type        = string
  description = "The security group ID for the ALB ingress controller"
  default     = "value"
}
variable "security_node_security_group_id" {
  type        = string
  description = "The security group ID for the EKS nodes"
  default     = "value"
}


variable "r53_subzone_name" {
  type        = string
  default     = ""
  description = "The subzone name"
}

variable "r53_hosted_zone_name" {
  type        = string
  default     = ""
  description = "The hosted zone name"
}
