locals {
  parent_dir   = dirname(get_terragrunt_dir())
  current_dir  = basename(get_terragrunt_dir())
  my_cluster   = format("%s-%s", local.current_dir, basename(local.parent_dir))
  my_env       = local.my_env_conf.locals.my_env
  my_env_conf  = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  my_region    = read_terragrunt_config(find_in_parent_folders("region.hcl")).locals.my_region
  cluster_name = "eks-${local.my_env}-${local.my_region}-${local.my_cluster}"
}