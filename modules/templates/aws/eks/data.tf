# Required to get token for authorization on EKS
data "aws_eks_cluster_auth" "eks" {
  name = var.cluster_name
}
data "aws_route53_zone" "parent_hosted_zone" {
  name = var.r53_hosted_zone_name
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {} # used for accesing Account ID and ARN
