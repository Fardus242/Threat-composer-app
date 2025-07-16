variable "domain_name" {
  description = "Domain name to request ACM certificate for"
  type        = string
}

variable "route53_zone_id" {
  description = "ID of the Route53 hosted zone for DNS validation"
  type        = string
}

variable "validation_method" {
  description = "Validation method for ACM certificate )"
  type        = string
  default     = "DNS"
}

variable "dns_ttl" {
  description = "TTL for DNS validation record"
  type        = number
  default     = 60
}
