locals {
  base_values = templatefile("${path.module}/values.yaml", {
    prometheus_server_volume_size        = var.prometheus_server_volume_size
    prometheus_alert_manager_volume_size = var.prometheus_alert_manager_volume_size
    loki_volume_size                     = var.loki_volume_size
    release_name                         = var.name
    domain                               = var.domain_name
    ingress_enabled                      = var.ingress_enabled
    cert_arn                             = var.certificate_arn
    github_oauth_enabled                 = var.github_oauth_enabled
    github_oauth_allowed_domains         = length(var.github_oauth_allowed_domains) == 0 ? "" : jsonencode(var.github_oauth_allowed_domains)
    github_oauth_allowed_organizations   = length(var.github_oauth_allowed_organizations) == 0 ? "" : jsonencode(var.github_oauth_allowed_organizations)
    github_oauth_allowed_team_ids        = length(var.github_oauth_allowed_team_ids) == 0 ? "" : join(",", var.github_oauth_allowed_team_ids)
    github_oauth_client_id               = var.github_oauth_client_id
    github_oauth_client_secret           = var.github_oauth_client_secret
    jaeger_enabled                       = var.jaeger_enabled
  })
}
