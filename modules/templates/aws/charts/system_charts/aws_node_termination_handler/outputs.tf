output "id" {
  value = one(helm_release.aws_nth[*].id)
}
