output "ebs_kms_key_arn" {
  description = "The ARN of the key"
  value       = module.ebs_kms_key.key_arn
}
