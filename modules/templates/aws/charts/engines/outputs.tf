output "argocd_url" {
  value = var.argocd_enabled ? local.argocd_url : null
}

output "jenkins_url" {
  value = var.jenkins_enabled ? local.jenkins_url : null
}

output "airflow_url" {
  value = var.airflow_enabled ? local.airflow_url : null
}

output "argo_workflows_url" {
  value = var.argo_workflows_enabled ? local.argo_workflows_url : null
}

output "argo_rollouts_url" {
  value = var.argo_rollouts_enabled ? module.argo_rollouts[0].argo_rollouts_url : null
}

output "argo_rollouts_demo_url" {
  value = var.argo_rollouts_customized_demo_enabled || var.argo_rollouts_traffic_light_demo_enabled ? module.argo_rollouts[0].argo_rollouts_demo_url : null
}
