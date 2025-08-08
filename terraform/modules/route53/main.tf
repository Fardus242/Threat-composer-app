resource "aws_route53_record" "subdomain" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "app.${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}

data "aws_route53_zone" "selected" {
  name = var.domain_name
}

