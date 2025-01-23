# Module for ALB Ingress Security Group
module "security_alb_ingress" {
  source                          = "./extra_sg"
  additional_sg_name              = "alb-ingress"
  description                     = "Security group for ALB ingress"
  vpc_id                          = var.vpc_id
  enable_source_security_group_id = false

  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "Allow HTTP traffic"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "Allow SSH traffic"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "Allow HTTPS traffic"
    },
    {
      from_port   = 8443
      to_port     = 8443
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "Allow 8443 HTTPS traffic"
    },
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "Allow 8080 HTTP traffic"
    },
  ]

  ingress_with_ipv6_cidr_blocks = [
    {
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      description      = "Service ports (ipv6)"
      ipv6_cidr_blocks = "::/0"
    },
    {
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      description      = "Service ports (ipv6)"
      ipv6_cidr_blocks = "::/0"
    },
    {
      from_port        = 8443
      to_port          = 8443
      protocol         = "tcp"
      description      = "Service ports (ipv6)"
      ipv6_cidr_blocks = "::/0"
    },
    {
      from_port        = 8080
      to_port          = 8080
      protocol         = "tcp"
      description      = "Service ports (ipv6)"
      ipv6_cidr_blocks = "::/0"
    },
  ]

  ingress_with_self = [
    {
      from_port   = -1
      to_port     = 0
      protocol    = 0
      description = "Allow all incoming connections from this security group"
      self        = true
    },
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = -1
      description = "Allow all outgoing connections to everywhere"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  egress_with_ipv6_cidr_blocks = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "tcp"
      description      = "Service ports (ipv6)"
      ipv6_cidr_blocks = "::/0"
    },
  ]
  tags = var.node_security_group_tags
}

# Module for Node Security Group
module "security_node" {
  source = "./extra_sg"
  #   source                          = "git::git@github.com:kwatatshey/prototyping-modules-repos.git//security?ref=v1.0.0s"
  additional_sg_name              = "node"
  description                     = "Security group for nodes"
  vpc_id                          = var.vpc_id
  enable_source_security_group_id = true

  ingress_with_cidr_blocks = [
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "Allow HTTPS traffic from EKS to EKS (internal calls)"
    },
  ]

  ingress_with_ipv6_cidr_blocks = [
    {
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      description      = "Service ports (ipv6)"
      ipv6_cidr_blocks = "::/0"
    },
  ]

  ingress_with_source_security_group_id = [
    {
      from_port                = 0
      to_port                  = 0
      protocol                 = -1
      description              = "Allow all incoming connections from ALB security group"
      source_security_group_id = module.security_alb_ingress.security_group_id
    },
  ]

  ingress_with_self = [
    {
      from_port   = -1
      to_port     = 0
      protocol    = 0
      description = "Allow all incoming connections from this security group"
      self        = true
    },
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = -1
      description = "Allow all outgoing connections to everywhere"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  egress_with_ipv6_cidr_blocks = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "tcp"
      description      = "Service ports (ipv6)"
      ipv6_cidr_blocks = "::/0"
    },
  ]
  tags       = var.node_security_group_tags
  depends_on = [module.security_alb_ingress]
}
