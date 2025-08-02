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

variable "security_group_id" {
  type        = string
  description = "Security group ID for the ECS service"
}

variable "target_group_arn" {
  type        = string
  description = "ARN of the ALB Target Group"
}
