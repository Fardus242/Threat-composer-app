variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_1_name" {
  description = "Name of Subnet 1"
  type        = string
}

variable "subnet_1_cidr" {
  description = "CIDR block for Subnet 1"
  type        = string
}

variable "subnet_1_az" {
  description = "Availability zone for Subnet 1"
  type        = string
}

variable "route_table_name" {
  description = "Name of the route table"
  type        = string
}

variable "routetable_cidrs" {
  description = "CIDR block for the route"
  type        = string
  default     = "0.0.0.0/0"
}

variable "internet_gateway_name" {
  description = "Name for Internet Gateway"
  type        = string
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
}

variable "security_group_description" {
  description = "Description of the security group"
  type        = string
}

variable "ingress_cidr_block" {
  description = "CIDR block for ingress"
  type        = string
  default     = "0.0.0.0/0"
}

variable "egress_cidr_block" {
  description = "CIDR block for egress"
  type        = string
  default     = "0.0.0.0/0"
}
