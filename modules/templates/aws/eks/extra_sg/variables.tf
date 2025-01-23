variable "additional_sg_name" {
  type        = string
  description = "The name of the security group"
}

variable "description" {
  type        = string
  description = "The description of the security group"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
}
# variable "ingress_with_cidr_blocks" {
#   description = "List of ingress rules with CIDR blocks"
#   type        = list(string)
#   default     = []
# }

# # Define ingress rules with IPv6 CIDR blocks
# variable "ingress_with_ipv6_cidr_blocks" {
#   description = "List of ingress rules with IPv6 CIDR blocks"
#   type        = list(string)
#   default     = []
# }

# # Define ingress rules with source security group ID
# variable "ingress_with_source_security_group_id" {
#   description = "List of ingress rules with source security group ID"
#   type        = list(string)
#   default     = []
# }

# # Define ingress rules with self
# variable "ingress_with_self" {
#   description = "List of ingress rules with self"
#   type        = list(string)
#   default     = []
# }

# # Define egress rules with CIDR blocks
# variable "egress_with_cidr_blocks" {
#   description = "List of egress rules with CIDR blocks"
#   type        = list(string)
#   default     = []
# }

# # Define egress rules with IPv6 CIDR blocks
# variable "egress_with_ipv6_cidr_blocks" {
#   description = "List of egress rules with IPv6 CIDR blocks"
#   type        = list(string)
#   default     = []
# }

###
###
variable "ingress_with_cidr_blocks" {
  description = "List of ingress rules with CIDR blocks"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = string
    description = string
  }))
  default = []
}

variable "ingress_with_ipv6_cidr_blocks" {
  description = "List of ingress rules with IPv6 CIDR blocks"
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    ipv6_cidr_blocks = string
    description      = string
  }))
  default = []
}

variable "ingress_with_source_security_group_id" {
  description = "List of ingress rules with source security group ID"
  type = list(object({
    from_port                = number
    to_port                  = number
    protocol                 = string
    description              = string
    source_security_group_id = string
  }))
  default = []
}

variable "ingress_with_self" {
  description = "List of ingress rules allowing traffic from the security group itself"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
    self        = bool
  }))
  default = []
}

variable "egress_with_cidr_blocks" {
  description = "List of egress rules with CIDR blocks"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = string
    description = string
  }))
  default = []
}

variable "egress_with_ipv6_cidr_blocks" {
  description = "List of egress rules with IPv6 CIDR blocks"
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    ipv6_cidr_blocks = string
    description      = string
  }))
  default = []
}

##
###

# Define timeouts for resource creation and deletion
variable "create_timeout" {
  description = "Timeout for resource creation"
  type        = string
  default     = "15m"
}

variable "delete_timeout" {
  description = "Timeout for resource deletion"
  type        = string
  default     = "45m"
}

variable "enable_source_security_group_id" {
  description = "Enable source security group ID for ALB security group ingress"
  type        = bool
  default     = false
}
