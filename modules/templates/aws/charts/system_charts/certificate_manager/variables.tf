# tflint-ignore: terraform_unused_declarations
variable "cluster_name" {
  description = "The name of the cluster"
  type        = string
}

variable "namespace" {
  description = "The namespace to install cert-manager into"
  type        = string
  default     = "cert-manager"
}

variable "cert_manager_helm_chart_version" {
  type        = string
  default     = "v1.16.1"
  description = "Cert Manager Helm chart version."
}

# tflint-ignore: terraform_unused_declarations
variable "cert_manager_issuer_staging_mode" {
  description = "Whether to create a staging issuer for cert-manager"
  type        = bool
  default     = true
}

# tflint-ignore: terraform_unused_declarations
variable "issuer_email" {
  description = "The email to use for the cert-manager issuer - Just for getting notification if renewal fails"
  type        = string
  default     = ""
}
