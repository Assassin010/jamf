#tfsec:ignore:aws-eks-no-public-cluster-access
#tfsec:ignore:aws-eks-no-public-cluster-access-to-cidr
#tfsec:ignore:aws-ec2-no-public-egress-sgr
#tfsec:ignore:aws-ec2-no-public-ingress-sgr
module "cluster" {
  source                                   = "terraform-aws-modules/eks/aws"
  version                                  = "20.8.5"
  cluster_name                             = var.cluster_name
  cluster_version                          = var.kubernets_version
  cluster_endpoint_private_access          = false
  cluster_endpoint_public_access           = true
  enable_cluster_creator_admin_permissions = true
  enable_irsa                              = true
  iam_role_use_name_prefix                 = false
  cluster_enabled_log_types                = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  subnet_ids                               = concat(var.public_subnet_ids, var.private_subnet_ids)
  vpc_id                                   = var.vpc_id
  cluster_additional_security_group_ids = [
    var.security_alb_ingress_security_group_id,
    var.security_node_security_group_id
  ]
  cluster_security_group_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
  access_entries = merge(local.user_access_entries, local.role_access_entries)
  tags           = var.tags
}

resource "aws_ec2_tag" "karpenter_public" {
  for_each    = toset(var.public_subnet_ids)
  resource_id = each.key
  key         = "karpenter.sh/discovery"
  value       = "${var.cluster_name}/public"
}

resource "aws_ec2_tag" "karpenter_private" {
  for_each    = toset(var.private_subnet_ids)
  resource_id = each.key
  key         = "karpenter.sh/discovery"
  value       = "${var.cluster_name}/private"
}

resource "aws_ec2_tag" "cluster_public" {
  for_each    = toset(var.public_subnet_ids)
  resource_id = each.key
  key         = "kubernetes.io/cluster/${var.cluster_name}"
  value       = "owned"
}

resource "aws_ec2_tag" "cluster_private" {
  for_each    = toset(var.private_subnet_ids)
  resource_id = each.key
  key         = "kubernetes.io/cluster/${var.cluster_name}"
  value       = "owned"
}
