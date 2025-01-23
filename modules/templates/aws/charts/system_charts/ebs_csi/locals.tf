locals {
  base_values = templatefile("${path.module}/values.yaml", {
    sa_name      = var.serviceaccount
    irsa_role    = module.ebs_csi_irsa_role.iam_role_arn
    release_name = var.name
    region       = var.region
  })
}
