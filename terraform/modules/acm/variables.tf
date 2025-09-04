variable "domain_name" {
  description = "Domain name for ACM certificate"
  type        = string
}

variable "route53_zone_id" {
  description = "Route53 hosted zone ID (optional, if needed elsewhere)"
  type        = string
  default     = ""
}
