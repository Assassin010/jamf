output "id" {
  value = one(helm_release.cas[*].id)
}