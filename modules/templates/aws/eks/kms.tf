module "ebs_kms_key" {
  source                       = "./nodegroup/kms"
  cluster_iam_role_arn         = module.cluster.cluster_iam_role_arn
  worker_nodes_kms_key_aliases = var.worker_nodes_kms_key_aliases
  tags                         = var.tags
}


