resource "aws_route53_zone" "cluster_zone" {
  name          = "${var.cluster_name}.${var.r53_hosted_zone_name}"
  comment       = "Separate zone for ${var.cluster_name} cluster"
  force_destroy = true

  tags = merge(
    var.tags,
    {
      "Creation_Time" = formatdate("DD.MM.YYYY_hh:mm:ss", timestamp())
    }
  )

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_route53_record" "ns" {
  name    = local.fqdn
  zone_id = data.aws_route53_zone.parent_hosted_zone.id
  records = aws_route53_zone.cluster_zone.name_servers
  type    = "NS"
  ttl     = "300"
}
