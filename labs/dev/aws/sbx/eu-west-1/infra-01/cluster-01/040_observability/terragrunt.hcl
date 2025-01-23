terraform {
  source = "${get_repo_root()}/modules/templates/aws/charts/observability"
}

# For Inputs
include "root" {
  path   = find_in_parent_folders()
  expose = true
}

# For AWS provider & tfstate S3 backand
include "cloud" {
  path = find_in_parent_folders("cloud.hcl")
}

# For Helm, Kubectl & GitHub providers
include "common_providers" {
  path = find_in_parent_folders("providers.hcl")
}

dependency "eks" {
  config_path = "../010_eks"
  mock_outputs = {
    vpc_id                             = "vpc-1234"
    r53_zone_name                      = "zone_id"
    cluster_endpoint                   = "https://example.com/eks"
    cluster_certificate_authority_data = "aGVsbG93b3JsZAo="
    cluster_name                       = "test_cluster"
    cluster_region                     = "eu-west-1"
    acm_certificate_arn                = "aGVsbG93b3JsZAo="
    cluster_oidc_provider_arn          = "arn::test"
    cluster_autoscaler = {
      enabled        = true
      namespace      = "dummy"
      serviceaccount = "sa"
      role_arn       = "arn::test"
    }
    alb_controller = {
      enabled        = true
      namespace      = "dummy"
      serviceaccount = "sa"
      role_arn       = "arn::test"
    }
    airflow = {
      enabled        = "true"
      namespace      = "dummy"
      serviceaccount = "sa"
    }
    external_dns = {
      enabled        = true
      namespace      = "dummy"
      serviceaccount = "sa"
      role_arn       = "arn::test"
    }
    external_secrets = {
      enabled        = true
      namespace      = "dummy"
      serviceaccount = "sa"
      role_arn       = "arn::test"
    }
    ebs_csi = {
      enabled        = true
      namespace      = "dummy"
      serviceaccount = "sa"
      role_arn       = "arn::test"
    }
    argocd = {
      enabled        = true
      namespace      = "dummy"
      serviceaccount = "sa"
    }
    jenkins = {
      enabled        = true
      namespace      = "dummy"
      serviceaccount = "sa"
    }
    loki_stack = {
      enabled                              = true
      namespace                            = "dummy"
      serviceaccount                       = "sa"
      ingress_enabled                      = true
      prometheus_server_volume_size        = "8Gi"
      prometheus_alert_manager_volume_size = "8Gi"
      loki_volume_size                     = "8Gi"
      github_oauth_client_id               = "dummy"
      github_oauth_client_secret           = "dummy"
      github_oauth_allowed_domains         = []
      github_oauth_allowed_organizations   = []
      github_oauth_allowed_team_ids        = []
      github_oauth_enabled                 = true
    }
  }
}

dependency "system_charts" {
  config_path  = "../020_system_charts"
  skip_outputs = true
}

inputs = {
  cluster_region            = dependency.eks.outputs.cluster_region
  cluster_name              = dependency.eks.outputs.cluster_name
  vpc_id                    = dependency.eks.outputs.vpc_id
  domain_name               = dependency.eks.outputs.r53_zone_name
  acm_certificate_arn       = dependency.eks.outputs.acm_certificate_arn
  cluster_oidc_provider_arn = dependency.eks.outputs.cluster_oidc_provider_arn

  # kube-prometheus-stack
}
