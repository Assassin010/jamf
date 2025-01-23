module "eks_addons" {
  source            = "./addons"
  enable_eks_addons = var.enable_eks_addons
  cluster_name      = var.cluster_name
  addons            = var.addons
  tags              = var.tags
  depends_on        = [module.nodes]
}

