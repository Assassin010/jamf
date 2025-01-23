module "fargate_profile" {
  source                       = "terraform-aws-modules/eks/aws//modules/fargate-profile"
  version                      = "20.31.3"
  create                       = var.create_fargate_profile
  name                         = var.fargate_profile_name
  cluster_name                 = var.cluster_name
  create_iam_role              = true
  iam_role_name                = var.fargate_profile_iam_role_name
  iam_role_use_name_prefix     = false
  iam_role_attach_cni_policy   = true
  iam_role_additional_policies = var.fargate_profile_additional_policies
  subnet_ids                   = var.subnet_ids
  timeouts = {
    create = "5m"
    update = "5m"
  }
  selectors = var.fargate_profile_selectors
  tags      = var.tags
}


# module "fargate" {
#   source = "terraform-aws-modules/eks/aws//modules/fargate-profile"

#   for_each = var.fargate_profiles

#   name          = each.value.name
#   namespace     = each.value.namespace
#   iam_role_name = each.value.iam_role_name
#   subnet_ids    = var.subnet_ids
#   selectors     = each.value.selectors

#   tags = {
#     Environment = "production"
#     Project     = each.value.name
#   }

#   # Assuming additional_policies are required in your setup for each profile
#   iam_policies = values(each.value.additional_policies)
# }
