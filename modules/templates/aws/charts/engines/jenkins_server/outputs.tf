output "id" {
  value = one(helm_release.jenkins[*].id)
}
