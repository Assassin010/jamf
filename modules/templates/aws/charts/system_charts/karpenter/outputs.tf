output "id" {
  value = one(helm_release.karpenter[*].id)
}
output "role_arn" {
  value = module.karpenter.role_arn
}
