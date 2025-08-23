# data "aws_route53_zone" "selected" {
#   name = var.domain_name
# }

# resource "aws_route53_record" "root" {
#   zone_id = data.aws_route53_zone.selected.id
#   name    = var.domain_name  
#   type    = "A"

#   alias {
#     name                   = var.alb_dns_name  
#     zone_id                = var.alb_zone_id
#     evaluate_target_health = true
#   }
# }

data "aws_route53_zone" "selected" {
  name = var.domain_name
}

resource "aws_route53_record" "subdomain" {
  zone_id = data.aws_route53_zone.selected.id
  name    = "tm.${var.domain_name}"  
  type    = "A"

  alias {
    name                   = var.alb_dns_name   
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}
