variable "name" {
  type        = string
  description = "Name of release"
  default     = "loki-stack"
}

variable "namespace" {
  type        = string
  description = "Namespace name to deploy helm release"
  default     = "loki-stack"
}

variable "chart_version" {
  type        = string
  description = "Helm chart to release"
  default     = "2.10.2"
}

variable "enabled" {
  type        = bool
  description = "Enable or not chart as a component"
  default     = false
}

variable "extra_values" {
  type        = map(any)
  description = "Extra values in key value format"
  default     = {}
}

# tflint-ignore: terraform_unused_declarations
variable "serviceaccount" {
  type        = string
  description = "Serviceaccount name"
  default     = "loki-stack"
}

# tflint-ignore: terraform_unused_declarations
variable "cluster_name" {
  type        = string
  description = "Name of EKS cluster"
}

variable "domain_name" {
  type        = string
  description = "Roure53 hosted zone name"
}

variable "certificate_arn" {
  type        = string
  description = "ACM Certificate ARN"
}

variable "ingress_enabled" {
  type        = bool
  default     = false
  description = "Enable or not ingress for loki stack"
}

variable "prometheus_server_volume_size" {
  type        = string
  default     = "20Gi"
  description = "Size of EBS volume for prometheus server"
}

variable "prometheus_alert_manager_volume_size" {
  type        = string
  default     = "5Gi"
  description = "Size of EBS volume for prometheus alert manager"
}

variable "loki_volume_size" {
  type        = string
  default     = "20Gi"
  description = "Size of EBS volume for loki"
}

variable "github_oauth_client_id" {
  type        = string
  default     = ""
  description = "Github OAuth Client Id"
}

variable "github_oauth_client_secret" {
  type        = string
  default     = ""
  sensitive   = true
  description = "Github OAuth Client Secret"
}

variable "github_oauth_allowed_domains" {
  type        = list(string)
  default     = []
  description = "List of allowed domains for Github OAuth"
}

variable "github_oauth_allowed_organizations" {
  type        = list(string)
  default     = []
  description = "List of allowed organizations for Github OAuth"
}

variable "github_oauth_allowed_team_ids" {
  type        = list(string)
  default     = []
  description = "List of allowed teams for Github OAuth"
}

variable "github_oauth_enabled" {
  type        = bool
  default     = false
  description = "Enable or not Github OAuth"
}

variable "jaeger_enabled" {
  type        = bool
  default     = false
  description = "Enable Grafana Jaeger Datasource"
}
