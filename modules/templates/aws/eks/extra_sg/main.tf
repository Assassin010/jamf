# ################################################
# # Security group with complete set of arguments
# ################################################

# Create the security group
#tfsec:ignore:aws-ec2-no-excessive-port-access
#tfsec:ignore:aws-ec2-no-public-ingress-acl
#tfsec:ignore:aws-ec2-no-public-egress-sgr
#tfsec:ignore:aws-ec2-no-public-ingress-sgr
module "security_group" {
  source                                = "terraform-aws-modules/security-group/aws"
  version                               = "5.1.2"
  create                                = true
  name                                  = var.additional_sg_name
  description                           = var.description
  vpc_id                                = var.vpc_id
  ingress_with_cidr_blocks              = var.ingress_with_cidr_blocks
  ingress_with_ipv6_cidr_blocks         = var.ingress_with_ipv6_cidr_blocks
  ingress_with_source_security_group_id = var.enable_source_security_group_id ? var.ingress_with_source_security_group_id : []
  ingress_with_self                     = var.ingress_with_self
  egress_with_cidr_blocks               = var.egress_with_cidr_blocks
  egress_with_ipv6_cidr_blocks          = var.egress_with_ipv6_cidr_blocks
  create_timeout                        = var.create_timeout
  delete_timeout                        = var.delete_timeout
  tags                                  = var.tags
}
