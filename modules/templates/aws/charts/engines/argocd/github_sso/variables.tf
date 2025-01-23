variable "namespace" {
  type = string
}

variable "awssm_secret_name" {
  type        = string
  description = "Name of AWSSM secret"
}

variable "argocd_github_sso_secret" {
  type        = string
  description = "Name of secret contains GitHub app credentials"
}

variable "cluster_secret_store_ref_name" {
  type        = string
  description = "ClusterSecretStore name"
}
