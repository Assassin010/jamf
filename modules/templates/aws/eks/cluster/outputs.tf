output "cluster_certificate_authority_data" {
  description = "Cluster certificate authority data"
  value       = module.cluster.cluster_certificate_authority_data
}

output "cluster_arn" {
  description = "Cluster ARN"
  value       = module.cluster.cluster_arn
}

output "cluster_iam_role_arn" {
  description = "Cluster IAM role"
  value       = module.cluster.cluster_iam_role_arn
}

output "cluster_endpoint" {
  description = "Cluster endpoint"
  value       = module.cluster.cluster_endpoint
}

output "cluster_iam_role_name" {
  description = "Cluster IAM role name"
  value       = module.cluster.cluster_iam_role_name
}

output "cluster_id" {
  description = "Cluster ID"
  value       = module.cluster.cluster_id
}

output "cluster_identity_providers" {
  description = "Cluster identity providers"
  value       = module.cluster.cluster_identity_providers
}

output "cluster_ip_family" {
  description = "Cluster IP family"
  value       = module.cluster.cluster_ip_family
}

output "cluster_name" {
  description = "Cluster name"
  value       = module.cluster.cluster_name
}

output "cluster_oidc_issuer_url" {
  description = "Cluster OIDC issuer URL"
  value       = module.cluster.cluster_oidc_issuer_url
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

output "kms_key_arn" {
  description = "KMS key ARN"
  value       = module.cluster.kms_key_arn
}

output "kms_key_id" {
  description = "KMS key ID"
  value       = module.cluster.kms_key_id
}

output "kms_key_policy" {
  description = "KMS key policy"
  value       = module.cluster.kms_key_policy
}

output "node_security_group_arn" {
  description = "Node security group ARN"
  value       = module.cluster.node_security_group_arn
}

output "oidc_provider" {
  description = "OIDC provider"
  value       = module.cluster.oidc_provider
}

output "oidc_provider_arn" {
  description = "OIDC provider ARN"
  value       = module.cluster.oidc_provider_arn
}

output "cloudwatch_log_group_arn" {
  description = "CloudWatch log group ARN"
  value       = module.cluster.cloudwatch_log_group_arn
}

output "cloudwatch_log_group_name" {
  description = "CloudWatch log group name"
  value       = module.cluster.cloudwatch_log_group_name
}

output "eks_token" {
  description = "Authorization token for EKS K8S cluster"
  value       = data.aws_eks_cluster_auth.eks.token
  sensitive   = true
}

output "acm_certificate_arn" {
  value = module.certificate.acm_certificate_arn
}


output "r53_zone_name" {
  description = "Cluster route53 zone name"
  value       = aws_route53_zone.cluster_zone.name
}

output "r53_zone_id" {
  description = "Cluster route53 zone id"
  value       = aws_route53_zone.cluster_zone.id
}
