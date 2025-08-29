variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "subnet_1_name" {
  type = string
}

variable "subnet_1_cidr" {
  type = string
}

variable "subnet_1_az" {
  type = string
}

variable "subnet_2_name" {
  type = string
}

variable "subnet_2_cidr" {
  type = string
}

variable "subnet_2_az" {
  type = string
}

variable "route_table_name" {
  type = string
}

variable "routetable_cidrs" {
  type = list(string)
}

variable "internet_gateway_name" {
  type = string
}

variable "security_group_name" {
  type = string
}

variable "security_group_description" {
  type = string
}

variable "ingress_cidr_block" {
  type = string
}

variable "egress_cidr_block" {
  type = string
}

variable "domain_name" {
  description = "Domain name for ACM certificate"
  type        = string
}

# variable "route53_zone_id" {
#   description = "Route53 hosted zone ID"
#   type        = string
# }

# variable "validation_method" {
#   description = "ACM certificate validation method"
#   type        = string
#   default     = "DNS"
# }

# variable "dns_ttl" {
#   description = "TTL for ACM DNS validation record"
#   type        = number
#   default     = 60
# }

# variable "vpc_id" {}
# variable "subnet_ids" {
#   type = list(string)
# }

# variable "listener_port" {
#   type    = number
#   default = 80
# }

# variable "listener_protocol" {
#   type    = string
#   default = "HTTP"
# }

# variable "target_group_port" {
#   type    = number
#   default = 80
# }

# variable "target_group_protocol" {
#   type    = string
#   default = "HTTP"
# }

# variable "health_check_path" {
#   type    = string
#   default = "/"
# }

variable "host_port" {
  type    = number
  default = 3000
}

variable "container_port" {
  type    = number
  default = 3000
}

# ecs

variable "cluster_name" {
  type        = string
  description = "Name of the ECS cluster"
}

variable "task_family" {
  type        = string
  description = "ECS Task family name"
}

variable "container_name" {
  type        = string
  description = "Container name"
}

variable "container_image" {
  type        = string
  description = "Docker image for the container"
}

variable "cpu" {
  type        = string
  description = "CPU units for the ECS task"
}

variable "memory" {
  type        = string
  description = "Memory (in MiB) for the ECS task"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "service_name" {
  type        = string
  description = "Name of the ECS service"
}

variable "desired_count" {
  type        = number
  description = "Number of ECS tasks to run"
}

# variable "security_group_id" {
#   type        = string
#   description = "Security group ID for the ECS service"
# }

# variable "target_group_arn" {
#   type        = string
#   description = "ARN of the ALB Target Group"
# }

# ecs

variable "ecs_security_group_name" {
  type        = string
  description = "Name of ECS security group"
}

variable "ecs_security_group_description" {
  type        = string
  description = "Description for ECS security group"
}

# variable "ecs_ingress_port" {
#   type        = number
#   description = "Ingress port for ECS service"
# }

variable "ecs_ingress_cidr_block" {
  type        = string
  description = "CIDR block for ECS ingress"
}

variable "app_from_port" {
  type        = number
  description = "Port from which the application will be accessible"
}

variable "app_to_port" {
  type        = number
  description = "Port to which the application will be accessible"
}
