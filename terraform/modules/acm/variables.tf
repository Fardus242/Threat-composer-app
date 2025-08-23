variable "domain_name" {
  description = "Domain name for ACM certificate"
  type        = string
}

variable "route53_zone_id" {
  description = "Route53 hosted zone ID"
  type        = string
  default     = ""
}

variable "validation_method" {
  description = "Validation method for ACM certificate"
  type        = string
  default     = "DNS"
}

variable "dns_ttl" {
  description = "TTL for DNS validation record"
  type        = number
  default     = 60
}
