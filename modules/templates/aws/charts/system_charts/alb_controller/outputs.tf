output "id" {
  value = one(helm_release.alb_controller[*].id)
}