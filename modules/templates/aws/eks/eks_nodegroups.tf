module "nodes" {
  source                            = "./nodegroup"
  for_each                          = var.eks_managed_node_groups
  name                              = each.key
  cluster_name                      = module.cluster.cluster_name
  cluster_version                   = module.cluster.cluster_version
  cluster_service_cidr              = module.cluster.cluster_service_cidr
  create_managed_node_groups        = var.create_managed_node_groups
  nodegroup_subnet_ids              = var.nodegroup_subnet_ids
  eks_managed_node_groups           = var.eks_managed_node_groups
  cluster_primary_security_group_id = module.cluster.cluster_primary_security_group_id
  vpc_security_group_ids = [
    module.security_alb_ingress.security_group_id,
    module.security_node.security_group_id
  ]
  ami_type                           = each.value["ami_type"]
  min_size                           = each.value["min_size"]
  max_size                           = each.value["max_size"]
  desired_size                       = each.value["desired_size"]
  instance_types                     = each.value["instance_types"]
  capacity_type                      = each.value["capacity_type"]
  iam_node_group_role                = var.iam_node_group_role
  network_interfaces                 = each.value["network_interfaces"]
  autoscaling_average_cpu            = var.autoscaling_average_cpu
  iam_role_nodes_additional_policies = var.iam_role_nodes_additional_policies
  node_add_policy_name               = var.node_add_policy_name
  ebs_kms_key_arn                    = module.ebs_kms_key.ebs_kms_key_arn
  tag_specifications                 = ["instance", "volume", "network-interface"]
  tags                               = var.tags
  depends_on                         = [module.cluster]
}
