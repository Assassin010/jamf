# General
variable "region" {
  type = string
}
variable "cluster_name" {
  type = string
}
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

# Jenkins server
variable "jenkins_enabled" {
  type    = bool
  default = false
}
variable "jenkins_namespace" {
  type    = string
  default = "jenkins"
}
variable "jenkins_serviceaccount" {
  type    = string
  default = "jenkins"
}

## Apache Airflow
variable "airflow_enabled" {
  type    = bool
  default = false
}
variable "airflow_namespace" {
  type    = string
  default = "airflow"
}
variable "airflow_serviceaccount" {
  type    = string
  default = "airflow"
}

## GitHub Actions Runners Controller
# tflint-ignore: terraform_unused_declarations
variable "github_actions_runner_controller_enabled" {
  type    = bool
  default = false
}

# tflint-ignore: terraform_unused_declarations
variable "github_runner_serviceaccount" {
  type    = string
  default = "actions-runner-system"
}

# tflint-ignore: terraform_unused_declarations
variable "github_runners_extra_values" {
  type    = map(any)
  default = {}
}

# tflint-ignore: terraform_unused_declarations
variable "github_token" {
  type    = string
  default = ""
}

# tflint-ignore: terraform_unused_declarations
variable "github_token_ssm_parameter" {
  type    = string
  default = ""
}

# tflint-ignore: terraform_unused_declarations
variable "github_runner_reg_url" {
  type    = string
  default = ""
}

# tflint-ignore: terraform_unused_declarations
variable "github_webhook_server_enabled" {
  type    = bool
  default = false
}

# tflint-ignore: terraform_unused_declarations
variable "github_webhook_server_host" {
  type    = string
  default = ""
}

# tflint-ignore: terraform_unused_declarations
variable "github_webhook_server_path" {
  type    = string
  default = "/"
}

# tflint-ignore: terraform_unused_declarations
variable "github_webhook_server_secret_enabled" {
  type    = bool
  default = false
}

# tflint-ignore: terraform_unused_declarations
variable "github_runners_deploy_list" {
  type = list(object({
    name          = optional(string)
    repository    = optional(string)
    limits_cpu    = optional(string)
    limits_memory = optional(string)
    replicas_min  = optional(number)
    replicas_max  = optional(number)
  }))
  default = []
}

#ArgoCD
variable "argocd_release_name" {
  type        = string
  description = "Name of release"
  default     = "argocd"
}
variable "argocd_enabled" {
  type    = bool
  default = false
}
variable "argocd_namespace" {
  type        = string
  description = "Namespace to install the chart into"
  default     = "argocd"
}

# GitOps repository
variable "gitops_repo_enabled" {
  type        = bool
  description = "Whether sync ArgoCD to GitOps repository"
  default     = false
}
variable "github_org" {
  type        = string
  description = "GitHub organization name"
  default     = ""
}
variable "gitops_repo" {
  type        = string
  description = "GitOps repository name"
  default     = "gitops"
}

# Microservices repositories
variable "github_repositories_enabled" {
  type        = bool
  description = "Connect repositories to ArgoCD"
  default     = false
}
variable "github_repositories" {
  type    = list(string)
  default = []
}

# ECR registry
variable "ecr_reg_enabled" {
  type        = bool
  description = "Whether sync ArgoCD to ECR registry"
  default     = false
}
variable "cluster_oidc_issuer_url" {
  type        = string
  description = "cluster_oidc_issuer_url"
}

# ArgoCD GitHub SSO
variable "argocd_sso_enabled" {
  type        = bool
  default     = false
  description = "Whether to use ArgoCD SSO"
}
variable "github_argocd_admins_team" {
  type        = string
  description = "Name of ArgoCD admins-team on GitHub"
  default     = "argocd-admins"
}
variable "argocd_github_sso_secret" {
  type        = string
  description = "Name of secret contains GitHub app credentials"
  default     = "argocd-github-sso"
}
variable "awssm_sso_secret_name" {
  type        = string
  description = "Name of AWSSM secret where sso secrets are stored"
}
variable "cluster_secret_store_ref_name" {
  type        = string
  description = "ClusterSecretStore name"
}

# ArgoCD Slack Channel
variable "argocd_slack_enabled" {
  type        = bool
  default     = false
  description = "Whether to connect ArgoCD to Slack channel"
}
variable "argocd_slack_channel" {
  type        = string
  default     = "argocd-channel"
  description = "Name of ArgoCD admins-team on GitHub"
}
variable "awssm_slack_secret_name" {
  type        = string
  default     = "argocd-slack-app-token"
  description = "Name of AWSSM secret where slack token is stored"
}
variable "possitive_feedback" {
  type        = bool
  default     = false
  description = "Whether to get possitive notifications from ArgoCD"
}
variable "negative_feedback" {
  type        = bool
  default     = true
  description = "Whether to get negattive notifications from ArgoCD"
}
variable "slack_poc_enabled" {
  type        = bool
  default     = false
  description = "Whether to test your slack channel with ArgoCD notification"
}

# Argo-Rollouts Extension for ArgoCD
variable "argo_rollouts_extension_enable" {
  type        = bool
  default     = false
  description = "Whether to install Argo-Rollouts extension for ArgoCD"
}

## Argo Workflows
variable "argo_workflows_enabled" {
  type    = bool
  default = false
}
variable "argo_workflows_namespace" {
  type    = string
  default = "argo"
}
variable "argo_workflows_release_name" {
  type        = string
  default     = "argo-workflows"
  description = "Release name of argo-workflows"
}
variable "argo_workflows_sso_enabled" {
  type    = bool
  default = false
}

## Argo Rollouts
variable "argo_rollouts_enabled" {
  type    = bool
  default = false
}
variable "argo_rollouts_dashboard_enabled" {
  type        = bool
  default     = true
  description = "Enable Argo-Rollouts dashboard ui"
}
variable "argo_rollouts_namespace" {
  type    = string
  default = "argo-rollouts"
}
variable "argo_rollouts_customized_demo_enabled" {
  type        = bool
  description = "Create your own customize rollouts demo"
  default     = false
}
variable "argo_rollouts_traffic_light_demo_enabled" {
  type        = bool
  description = "Create traffic_light rollouts demo"
  default     = false
}

# Kyverno UI
variable "kyverno_enabled" {
  type        = bool
  description = "Whethe to install Kyverno"
  default     = false
}
variable "policy_reporter_settings" {
  type        = map(any)
  description = "Settings for policy reporter"
}

variable "policy_reporter_namespace" {
  type        = string
  description = "Namespace to install the chart into"
}

variable "policy_reporter_helm_chart_name" {
  type        = string
  description = "Name of the chart to install"
}

variable "policy_reporter_release_name" {
  type        = string
  description = "Name of the release"
}

variable "policy_reporter_helm_chart_version" {
  type        = string
  description = "Version of the chart to install"
}

variable "ui_enabled" {
  type        = bool
  description = "Enable the UI"
  default     = false
}
