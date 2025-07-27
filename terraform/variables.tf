variable "vpc_name" {}
variable "vpc_cidr" {}

variable "subnet_1_name" {}
variable "subnet_1_cidr" {}
variable "subnet_1_az" {}

variable "route_table_name" {}
variable "routetable_cidrs" {}

variable "internet_gateway_name" {}

variable "security_group_name" {}
variable "security_group_description" {}

variable "ingress_cidr_block" {}
variable "egress_cidr_block" {}

variable "domain_name" {
  description = "Domain name for ACM certificate"
  type        = string
}

variable "route53_zone_id" {
  description = "Route53 hosted zone ID"
  type        = string
}

variable "validation_method" {
  description = "ACM certificate validation method"
  type        = string
  default     = "DNS"
}

variable "dns_ttl" {
  description = "TTL for ACM DNS validation record"
  type        = number
  default     = 60
}

variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}
variable "lb_security_group_id" {}

variable "listener_port" {
  type    = number
  default = 80
}

variable "listener_protocol" {
  type    = string
  default = "HTTP"
}

variable "target_group_port" {
  type    = number
  default = 80
}

variable "target_group_protocol" {
  type    = string
  default = "HTTP"
}

variable "health_check_path" {
  type    = string
  default = "/"
}

variable "host_port" {
  type    = number
  default = 3000
}


variable "container_port" {
  type    = number
  default = 3000
}