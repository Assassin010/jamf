locals {
  argocd_hostname         = "${var.argocd_release_name}.${var.domain_name}"
  argocd_url              = "https://${local.argocd_hostname}"
  jenkins_url             = "https://jenkins.${var.domain_name}"
  airflow_url             = "https://airflow.${var.domain_name}"
  argo_workflows_hostname = "${var.argo_workflows_release_name}.${var.domain_name}"
  argo_workflows_url      = "https://${local.argo_workflows_hostname}"
}
