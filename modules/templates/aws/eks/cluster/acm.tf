module "certificate" {
  source                    = "terraform-aws-modules/acm/aws"
  version                   = "4.3.1"
  subject_alternative_names = ["*.${local.fqdn}"]
  domain_name               = local.fqdn
  zone_id                   = aws_route53_zone.cluster_zone.id
  tags                      = var.tags
}
