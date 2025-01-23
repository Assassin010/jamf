resource "aws_eks_addon" "this" {
  count                       = var.enable_eks_addons ? length(local.addons) : 0
  cluster_name                = var.cluster_name
  addon_name                  = local.addons[count.index].addon_name
  addon_version               = local.addons[count.index].addon_version != "" ? local.addons[count.index].addon_version : null
  service_account_role_arn    = local.addons[count.index].service_account_role_arn != "" ? local.addons[count.index].service_account_role_arn : null
  resolve_conflicts_on_create = "OVERWRITE"
  tags                        = var.tags
}
