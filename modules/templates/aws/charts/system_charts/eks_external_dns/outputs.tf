output "id" {
  value = one(helm_release.external_dns[*].id)
}