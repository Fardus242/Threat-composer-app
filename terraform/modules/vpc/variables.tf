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

variable "subnet_2_name" {
  description = "Name of Subnet 2"
  type        = string
}

variable "subnet_2_cidr" {
  description = "CIDR block for Subnet 2"
  type        = string
}

variable "subnet_2_az" {
  description = "Availability zone for Subnet 2"
  type        = string
}

variable "route_table_name" {
  description = "Name of the route table"
  type        = string
}

variable "routetable_cidrs" {
  type        = string
  description = "CIDR block for the route table"
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

# For ECS
variable "ecs_security_group_name" {
  description = "Name of the ECS security group"
  type        = string
}

variable "ecs_security_group_description" {
  description = "Description of the ECS security group"
  type        = string
}

variable "ecs_ingress_cidr_block" {
  description = "CIDR block allowed to access ECS tasks"
  type        = string
}

variable "app_from_port" {
  description = "The starting port in the allowed port range."
  type        = number
}

variable "app_to_port" {
  description = "The ending port in the allowed port range."
  type        = number
}

variable "private_subnet_1_cidr" {
  description = "CIDR block for private subnet 1"
  type        = string
}

variable "private_subnet_1_az" {
  description = "Availability zone for private subnet 1"
  type        = string
}

variable "private_subnet_1_name" {
  description = "Name for private subnet 1"
  type        = string
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for private subnet 2"
  type        = string
}

variable "private_subnet_2_az" {
  description = "Availability zone for private subnet 2"
  type        = string
}

variable "private_subnet_2_name" {
  description = "Name for private subnet 2"
  type        = string
}

variable "private_nacl_config" {
  description = "Network ACL rules for private subnets with NAT and ECS access"
  type = list(object({
    rule_number : number
    egress      : bool
    protocol    : string
    rule_action : string
    cidr_block  : string
    from_port   : number
    to_port     : number
  }))

  default = [
    {
      rule_number = 100,
      egress      = true,
      protocol    = "-1",
      rule_action = "allow",
      cidr_block  = "0.0.0.0/0",
      from_port   = 0,
      to_port     = 0
    },
    {
      rule_number = 100,
      egress      = false,
      protocol    = "-1",
      rule_action = "allow",
      cidr_block  = "0.0.0.0/0",
      from_port   = 0,
      to_port     = 0
    },
    {
      rule_number = 200,
      egress      = true,
      protocol    = "-1",
      rule_action = "deny",
      cidr_block  = "0.0.0.0/0",
      from_port   = 0,
      to_port     = 0
    },
    {
      rule_number = 200,
      egress      = false,
      protocol    = "-1",
      rule_action = "deny",
      cidr_block  = "0.0.0.0/0",
      from_port   = 0,
      to_port     = 0
    }
  ]
}
