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

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for the ECS service"
}

variable "host_port" {
  type        = number
  description = "Host port to map in container definition"
}

variable "container_port" {
  type        = number
  description = "Container port to expose"
}



variable "target_group_arn" {
  type        = string
  description = "ARN of the ALB Target Group"
}


variable "vpc_id" {
  description = "VPC ID for ECS security group"
  type        = string
}

variable "ecs_security_group_name" {
  description = "Name of the ECS security group"
  type        = string
}

variable "ecs_security_group_description" {
  description = "Description for the ECS security group"
  type        = string
}

variable "ecs_ingress_cidr_block" {
  description = "CIDR block for ECS SG ingress"
  type        = string
}

variable "app_from_port" {
  description = "Starting port for app traffic"
  type        = number
}

variable "app_to_port" {
  description = "Ending port for app traffic"
  type        = number
}

variable "ecs_security_group_id" {
  type = string

}