locals {
  base_values = templatefile("${path.module}/values.yaml", {
    release_name = var.name
    sa_name      = var.serviceaccount
    irsa_role    = module.jenkins_irsa_role.iam_role_arn
    cert_arn     = var.certificate_arn
    domain       = var.domain_name
  })
}
