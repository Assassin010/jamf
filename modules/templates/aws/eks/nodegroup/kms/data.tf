
# tflint-ignore: terraform_unused_declarations
data "aws_caller_identity" "current" {} # data.aws_caller_identity.current.account_id
# tflint-ignore: terraform_unused_declarations
data "aws_region" "current" {} # data.aws_region.current.name

output "account_id" {
  description = "Selected AWS Account ID"
  value       = data.aws_caller_identity.current.account_id
}

output "region" {
  description = "Details about selected AWS region"
  value       = data.aws_region.current.name
}
