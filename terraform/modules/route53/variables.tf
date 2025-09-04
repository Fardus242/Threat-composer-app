variable "hosted_zone_name" {
  description = "Base domain hosted in Route53 (must match exactly, e.g. tm-fardus.com.)"
  type        = string
}

variable "subdomain" {
  description = "Subdomain prefix (e.g. tm)"
  type        = string
}

variable "alb_dns_name" {
  description = "DNS name of the ALB"
  type        = string
}

variable "alb_zone_id" {
  description = "Zone ID of the ALB"
  type        = string
}

