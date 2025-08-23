
data "aws_route53_zone" "selected" {
  count = var.route53_zone_id == "" ? 1 : 0
  name  = "${var.domain_name}."
}

locals {
  effective_zone_id = var.route53_zone_id != "" ? var.route53_zone_id : data.aws_route53_zone.selected[0].zone_id
}

resource "aws_acm_certificate" "cert" {
  domain_name       = "tm.${var.domain_name}"
  validation_method = "DNS"

  tags = {
    Name = "tm.${var.domain_name}-cert"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      record = dvo.resource_record_value
    }
  }

  zone_id = local.effective_zone_id
  name    = each.value.name
  type    = each.value.type
  records = [each.value.record]
  ttl     = var.dns_ttl
}

resource "aws_acm_certificate_validation" "cert_validation" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}
