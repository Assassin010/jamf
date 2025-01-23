resource "kubernetes_namespace" "namespace" {
  # count = !contains(data.kubernetes_all_namespaces.allns.namespaces, var.namespace) ? 1 : 0

  metadata {
    name = var.namespace
  }
}

resource "kubernetes_namespace" "argo-workflows-namespace" {
  # count = !contains(data.kubernetes_all_namespaces.allns.namespaces, var.namespace) ? 1 : 0

  metadata {
    name = var.argo_workflows_namespace
  }
}

resource "helm_release" "argocd" {
  namespace        = var.namespace
  name             = var.chart_name
  chart            = var.chart_name
  repository       = var.repository
  version          = var.chart_version
  recreate_pods    = var.recreate_pods
  timeout          = var.timeout
  create_namespace = false
  wait             = true

  values = [
    local.argocd_values
  ]

  depends_on = [
    kubernetes_namespace.namespace, kubernetes_namespace.argo-workflows-namespace
  ]

  lifecycle {
    precondition {
      condition     = fileexists(local.values_yaml_path)
      error_message = " --> Error: Failed to find '${local.values_yaml_path}'. Exit terraform process."
    }
  }
}

resource "kubectl_manifest" "main_project" {
  yaml_body = local.app_project_yaml

  depends_on = [
    helm_release.argocd
  ]

  lifecycle {
    precondition {
      condition     = fileexists(local.app_project_yaml_path)
      error_message = " --> Error: Failed to find '${local.app_project_yaml_path}'. Exit terraform process."
    }
  }
}

# Connect ECR registry to ArgoCD
module "ecr_registry" {
  count                   = var.ecr_reg_enabled ? 1 : 0
  source                  = "./ecr_registry"
  namespace               = var.namespace
  region                  = var.region
  serviceaccount          = var.serviceaccount
  cluster_oidc_issuer_url = var.cluster_oidc_issuer_url
  ecr_role_name           = local.ecr_role_name
  account_id              = data.aws_caller_identity.current.account_id

  depends_on = [
    helm_release.argocd
  ]
}

# Create & Sync GitOps repository with ARGOCD
module "gitops_repository" {
  count              = var.gitops_repo_enabled && var.github_org != "" ? 1 : 0
  source             = "./github_repositories"
  create_github_repo = true
  github_org         = var.github_org
  github_repo        = var.gitops_repo
  namespace          = var.namespace
  app_proj           = kubectl_manifest.main_project.name

  depends_on = [
    helm_release.argocd
  ]
}

# Sync GitHub repositories with ARGOCD
module "github_repositories" {
  for_each           = var.github_repositories_enabled && var.github_org != "" ? toset(var.github_repositories) : []
  source             = "./github_repositories"
  create_github_repo = false
  github_org         = var.github_org
  github_repo        = each.key
  namespace          = var.namespace

  depends_on = [
    helm_release.argocd
  ]
}

# GitHub SSO for ArgoCD
module "github_sso_argocd" {
  count                         = local.argocd_sso_enabled ? 1 : 0
  source                        = "./github_sso"
  namespace                     = var.namespace
  awssm_secret_name             = var.awssm_sso_secret_name
  argocd_github_sso_secret      = var.argocd_github_sso_secret
  cluster_secret_store_ref_name = var.cluster_secret_store_ref_name

  depends_on = [
    kubernetes_namespace.namespace, kubernetes_namespace.argo-workflows-namespace
  ]
}

# GitHub SSO for Argo-Workflows in different namespace
module "github_sso_argo_workflows" {
  count                         = local.argo_workflows_sso_enabled && local.separate_namespaces ? 1 : 0
  source                        = "./github_sso"
  namespace                     = var.argo_workflows_namespace
  awssm_secret_name             = var.awssm_sso_secret_name
  argocd_github_sso_secret      = var.argocd_github_sso_secret
  cluster_secret_store_ref_name = var.cluster_secret_store_ref_name

  depends_on = [
    kubernetes_namespace.namespace, kubernetes_namespace.argo-workflows-namespace
  ]
}

# ArgoCD Slack Channel
module "slack" {
  count                         = local.argocd_slack_enabled ? 1 : 0
  source                        = "./slack"
  namespace                     = var.namespace
  awssm_secret_name             = var.awssm_slack_secret_name
  argocd_slack_app_secret       = var.argocd_slack_app_secret
  cluster_secret_store_ref_name = var.cluster_secret_store_ref_name
  slack_poc_enabled             = var.slack_poc_enabled

  depends_on = [
    kubernetes_namespace.namespace, kubernetes_namespace.argo-workflows-namespace
  ]
}
