# module "loki-stack" {
#   source                               = "./loki_stack"
#   enabled                              = var.loki_stack_enabled
#   namespace                            = var.loki_stack_namespace
#   serviceaccount                       = var.loki_stack_serviceaccount
#   cluster_name                         = var.cluster_name
#   domain_name                          = var.domain_name
#   certificate_arn                      = var.acm_certificate_arn
#   prometheus_server_volume_size        = var.loki_stack_prometheus_server_volume_size
#   prometheus_alert_manager_volume_size = var.loki_stack_prometheus_alert_manager_volume_size
#   loki_volume_size                     = var.loki_stack_loki_volume_size
#   ingress_enabled                      = var.loki_stack_ingress_enabled
#   github_oauth_client_id               = var.loki_stack_github_oauth_client_id
#   github_oauth_client_secret           = var.loki_stack_github_oauth_client_secret
#   github_oauth_allowed_domains         = var.loki_stack_github_oauth_allowed_domains
#   github_oauth_allowed_organizations   = var.loki_stack_github_oauth_allowed_organizations
#   github_oauth_allowed_team_ids        = var.loki_stack_github_oauth_allowed_team_ids
#   github_oauth_enabled                 = var.loki_stack_github_oauth_enabled
#   jaeger_enabled                       = var.jaeger_enabled
# }

# module "kubeshark" {
#   count               = var.kubeshark_enabled ? 1 : 0
#   source              = "./kubeshark_service"
#   name                = var.kubeshark_name
#   namespace           = var.kubeshark_namespace
#   domain_name         = var.domain_name
#   region              = var.cluster_region
#   acm_certificate_arn = var.acm_certificate_arn
#   scheme              = var.kubeshark_scheme
# }

# module "jaeger" {
#   count               = var.jaeger_enabled ? 1 : 0
#   source              = "./jaeger_service"
#   name                = var.jaeger_name
#   namespace           = var.jaeger_namespace
#   domain_name         = var.domain_name
#   region              = var.cluster_region
#   acm_certificate_arn = var.acm_certificate_arn
#   scheme              = var.jaeger_scheme
#   demo_app_enabled    = var.jaeger_demo_app_enabled
# }

module "prometheus-stack" {
  source    = "./prometheus_stack"
  enabled   = var.prometheus_stack_enabled ? 1 : 0
  namespace = var.prometheus_stack_namespace
  # serviceaccount  = var.prometheus_stack_serviceaccount
  # cluster_name    = var.cluster_name
  # domain_name     = var.domain_name
  # certificate_arn = var.acm_certificate_arn
}
