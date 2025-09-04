
data "aws_route53_zone" "selected" {
  count = var.route53_zone_id == "" ? 1 : 0
  name  = "${var.domain_name}."
}

locals {
  effective_zone_id = var.route53_zone_id != "" ? var.route53_zone_id : data.aws_route53_zone.selected[0].zone_id
}

data "aws_acm_certificate" "main" {
  domain      = "*.tm-fardus.com"        
  most_recent = true
}

