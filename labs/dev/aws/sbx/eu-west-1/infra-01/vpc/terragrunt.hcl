terraform {
  source = "${get_repo_root()}/modules/templates/aws/vpc-alls"
}

# For Inputs
include "root" {
  path   = find_in_parent_folders()
  expose = true
}

# For AWS provider & tfstate S3 backand
include "cloud" {
  path = find_in_parent_folders("cloud.hcl")
}

locals {
  my_env_conf = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  common_tags = include.root.locals.my_env_conf.inputs.common_tags
  my_region   = read_terragrunt_config(find_in_parent_folders("region.hcl")).locals.my_region
  my_stack    = read_terragrunt_config(find_in_parent_folders("stack.hcl")).locals.my_stack
  my_env      = local.my_env_conf.locals.my_env
}

inputs = {
  eip_name                = "nat-eip-${local.my_env}-${local.my_region}-${local.my_stack}"
  vpc_name                = "vpc-${local.my_env}-${local.my_region}-${local.my_stack}"
  main_network_block      = "10.0.0.0/16"
  database_subnets        = ["10.0.21.0/24", "10.0.22.0/24", "10.0.23.0/24"]
  private_subnets         = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets          = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  azs                     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  subnet_prefix_extension = 4
  zone_offset             = 8
  tags = merge(
    local.common_tags,
    {
      infra = true
    }
  )
}
