locals {
  base_values = templatefile("${path.module}/values.yaml", {
    sa_name      = var.serviceaccount
    release_name = var.name
    domain       = var.domain_name
    cert_arn     = var.certificate_arn
  })
}