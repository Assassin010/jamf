locals {
  base_values = templatefile("${path.module}/values.yaml", {
    release_name = var.name
    region       = var.region
    cluster_name = var.cluster_name
    sa_name      = var.serviceaccount
    irsa_role    = module.alb_controller_irsa_role.iam_role_arn
    vpc_id       = var.vpc_id
  })
}
