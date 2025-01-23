## Common variables
variable "cluster_region" {
  type = string
}
variable "cluster_name" {
  type = string
}

# tflint-ignore: terraform_unused_declarations
variable "cluster_oidc_provider_arn" {
  type = string
}

# tflint-ignore: terraform_unused_declarations
variable "vpc_id" {
  type = string
}
variable "domain_name" {
  type = string
}
variable "acm_certificate_arn" {
  type = string
}

# loki_stack
# variable "loki_stack_enabled" {
#   type    = bool
#   default = false
# }
# variable "loki_stack_namespace" {
#   type    = string
#   default = "loki_stack"
# }
# variable "loki_stack_serviceaccount" {
#   type    = string
#   default = "loki_stack"
# }

# variable "loki_stack_ingress_enabled" {
#   type    = bool
#   default = false
# }

# variable "loki_stack_prometheus_server_volume_size" {
#   type    = string
#   default = "20Gi"
# }

# variable "loki_stack_prometheus_alert_manager_volume_size" {
#   type    = string
#   default = "5Gi"
# }

# variable "loki_stack_loki_volume_size" {
#   type    = string
#   default = "20Gi"
# }

# variable "loki_stack_github_oauth_client_id" {
#   type        = string
#   default     = ""
#   description = "Github OAuth Client Id"
# }

# variable "loki_stack_github_oauth_client_secret" {
#   type        = string
#   default     = ""
#   sensitive   = true
#   description = "Github OAuth Client Secret"
# }

# variable "loki_stack_github_oauth_allowed_domains" {
#   type        = list(string)
#   default     = []
#   description = "List of allowed domains for Github OAuth"
# }

# variable "loki_stack_github_oauth_allowed_organizations" {
#   type        = list(string)
#   default     = []
#   description = "List of allowed organizations for Github OAuth"
# }

# variable "loki_stack_github_oauth_allowed_team_ids" {
#   type        = list(string)
#   default     = []
#   description = "List of allowed teams for Github OAuth"
# }

# variable "loki_stack_github_oauth_enabled" {
#   type        = bool
#   default     = false
#   description = "Enable or not Github OAuth"
# }

# Kubeshark vars
# variable "kubeshark_enabled" {
#   type    = bool
#   default = false
# }

# variable "kubeshark_name" {
#   type    = string
#   default = "kubeshark"
# }

# variable "kubeshark_namespace" {
#   type    = string
#   default = "kube-system"
# }

# variable "kubeshark_scheme" {
#   type    = string
#   default = "internet-facing"
# }

# Jaeger vars
# variable "jaeger_enabled" {
#   type    = bool
#   default = false
# }

# variable "jaeger_demo_app_enabled" {
#   type    = bool
#   default = false
# }

# variable "jaeger_name" {
#   type    = string
#   default = "jaeger"
# }

# variable "jaeger_namespace" {
#   type    = string
#   default = "jaeger"
# }

# variable "jaeger_scheme" {
#   type    = string
#   default = "internet-facing"
# }
