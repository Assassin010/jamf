output "node_group_autoscaling_group_names" {
  value = module.eks_managed_node_groups.node_group_autoscaling_group_names
}

output "additional_policy_arn" {
  value = module.additional_policy.arn
}

output "node_iam_role_arn" {
  value = module.eks_managed_node_groups.iam_role_arn
}

output "node_iam_role_name" {
  value = module.eks_managed_node_groups.iam_role_name
}
