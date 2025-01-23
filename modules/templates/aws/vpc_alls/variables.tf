variable "tags" {
  type    = map(string)
  default = {}
}
variable "eip_name" {
  type        = string
  description = "Name of the Elastic IP."
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC."
}

variable "main_network_block" {
  type        = string
  description = "Base CIDR block to be used in our VPC."
}
variable "azs" {
  type        = list(string)
  description = "List of Availability Zones to be used"
}

# tflint-ignore: terraform_unused_declarations
variable "subnet_prefix_extension" {
  type        = number
  description = "CIDR block bits extension to calculate CIDR blocks of each subnetwork."
}

# tflint-ignore: terraform_unused_declarations
variable "zone_offset" {
  type        = number
  description = "CIDR block bits extension offset to calculate Public subnets, avoiding collisions with Private subnets."
}

variable "private_subnets" {
  type        = list(string)
  description = "List of CIDR blocks to be used in Private subnets."
}

variable "public_subnets" {
  type        = list(string)
  description = "List of CIDR blocks to be used in Public subnets."
}

variable "database_subnets" {
  type        = list(string)
  description = "List of CIDR blocks to be used in Database subnets."
}
