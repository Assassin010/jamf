locals {
  my_org_conf     = read_terragrunt_config(find_in_parent_folders("org.hcl"))
  my_env_conf     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  my_account_conf = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  my_region_conf  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  my_stack_conf   = read_terragrunt_config(find_in_parent_folders("stack.hcl"))
}