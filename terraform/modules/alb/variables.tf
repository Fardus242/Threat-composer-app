variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "alb_sg_id" {
  type = string
}


variable "alb_sg_description" {
  type        = string
  description = "Description for the ALB security group"
  default     = "Security group for Application Load Balancer"
}


variable "security_group_id" {
  type = string
}
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
  default = 3000
}

variable "target_group_protocol" {
  type    = string
  default = "HTTP"
}


variable "health_check_path" {
  type    = string
  default = "/"
}

variable "health_check_matcher" {
  type    = string
  default = "200-399"
}

variable "health_check_interval" {
  type    = number
  default = 30
}

variable "health_check_timeout" {
  type    = number
  default = 5
}

variable "health_check_healthy_threshold" {
  type    = number
  default = 2
}

variable "health_check_unhealthy_threshold" {
  type    = number
  default = 2
}
