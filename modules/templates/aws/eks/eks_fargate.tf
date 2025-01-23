module "fargate" {
  source                              = "./fargates"
  for_each                            = var.fargate_profiles
  create_fargate_profile              = var.create_fargate_profile
  cluster_name                        = module.cluster.cluster_name
  fargate_profile_name                = each.value.name
  fargate_profile_namespace           = each.value.namespace
  fargate_profile_iam_role_name       = each.value.iam_role_name
  fargate_profile_additional_policies = each.value.additional_policies
  fargate_profile_selectors           = each.value.selectors
  subnet_ids                          = var.private_subnet_ids
  tags                                = var.tags
}
