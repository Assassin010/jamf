output "id" {
  value = one(helm_release.metrics_server[*].id)
}
