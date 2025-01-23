output "cluster_name" {
  description = "Name of EKS K8S cluster"
  value       = module.cluster.cluster_name
}

output "cluster_arn" {
  description = "ARN of EKS K8S cluster"
  value       = module.cluster.cluster_arn
}

output "cluster_id" {
  description = "ID of EKS K8S cluster"
  value       = module.cluster.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint of EKS K8S cluster"
  value       = module.cluster.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "Certificate of EKS K8S cluster (base64)"
  value       = module.cluster.cluster_certificate_authority_data
}

output "cluster_iam_role_arn" {
  description = "Cluster IAM role"
  value       = module.cluster.cluster_iam_role_arn
}

output "cluster_oidc_issuer_url" {
  description = "The URL on the EKS cluster for the OpenID Connect identity provider"
  value       = module.cluster.cluster_oidc_issuer_url
}

output "cluster_oidc_provider_arn" {
  description = "The ARN of the OpenID Connect identity provider"
  value       = module.cluster.oidc_provider_arn
}

output "vpc_id" {
  description = "VPC ID, where the cluster was deployed"
  value       = var.vpc_id
}

output "r53_zone_name" {
  description = "Cluster route53 zone name"
  value       = aws_route53_zone.cluster_zone.name
}

output "r53_zone_id" {
  description = "Cluster route53 zone id"
  value       = aws_route53_zone.cluster_zone.id
}

output "acm_certificate_arn" {
  description = "The ARN of the certificate"
  value       = module.certificate.acm_certificate_arn
}

# tflint-ignore: terraform_unused_declarations
output "cluster_region" {
  description = "Region where the cluster deployed"
  value       = data.aws_region.current.name
}

output "clsuter_iam_role_name" {
  description = "Cluster IAM role name"
  value       = module.cluster.cluster_iam_role_name
}

output "cluster_identity_providers" {
  description = "Cluster identity providers"
  value       = module.cluster.cluster_identity_providers
}

output "cluster_ip_family" {
  description = "Cluster IP family"
  value       = module.cluster.cluster_ip_family
}

output "cluster_platform_version" {
  description = "Cluster platform version"
  value       = module.cluster.cluster_platform_version
}

output "cluster_primary_security_group_id" {
  description = "Cluster primary security group ID"
  value       = module.cluster.cluster_primary_security_group_id
}

output "cluster_service_cidr" {
  description = "Cluster service CIDR"
  value       = module.cluster.cluster_service_cidr
}

output "cluster_status" {
  description = "Cluster status"
  value       = module.cluster.cluster_status
}

output "cluster_version" {
  description = "Cluster version"
  value       = module.cluster.cluster_version
}

output "node_security_group_arn" {
  description = "Node security group ARN"
  value       = module.cluster.node_security_group_arn
}

output "node_security_group_id" {
  description = "Node security group ID"
  value       = module.cluster.node_security_group_id
}

output "combined_primary_and_nodes_security_group_ids" {
  description = "Combined security groups"
  value       = concat([module.cluster.cluster_primary_security_group_id], [module.cluster.node_security_group_id])
}


output "cluster_oidc_provider" {
  description = "OIDC provider"
  value       = module.cluster.oidc_provider
}

output "cloudwatch_log_group_arn" {
  description = "CloudWatch log group ARN"
  value       = module.cluster.cloudwatch_log_group_arn
}

output "cloudwatch_log_group_name" {
  description = "CloudWatch log group name"
  value       = module.cluster.cloudwatch_log_group_name
}

output "cluster_token" {
  description = "Authorization token for EKS K8S cluster"
  value       = data.aws_eks_cluster_auth.eks.token
  sensitive   = true
}
