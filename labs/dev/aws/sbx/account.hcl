locals {
  r53_hosted_zone_name               = "solutionsconsulting.net"
  my_account                         = basename(get_terragrunt_dir())
  my_account_id                      = "955769636964"
  my_organization                    = "solutionsconsulting"
  code_store_s3_bucket_name          = "source-code-${local.tooling_aws_account_primary_region}-${local.tooling_aws_account_id}"
  tooling_aws_account_primary_region = "eu-west-1"
  tooling_aws_account_id             = "955769636964"
}
