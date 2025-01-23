output "argocd_url" {
  value = "https://${var.release_name}.${var.hostname}"
}
