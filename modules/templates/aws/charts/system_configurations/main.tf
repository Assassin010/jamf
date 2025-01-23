module "cer_manager_issuers" {
  source                              = "./cert_manager_issuers"
  cluster_name                        = var.cluster_name
  cert_manager_issuer_staging_mode    = var.cert_manager_issuer_staging_mode
  cert_manager_issuer_production_mode = var.cert_manager_issuer_production_mode
  issuer_email                        = var.issuer_email
  ingress_class_name                  = var.ingress_class_name
}