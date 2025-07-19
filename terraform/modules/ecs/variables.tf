variable "cluster_name" {}
variable "task_family" {}
variable "container_name" {}
variable "container_image" {}
variable "container_port" {}
variable "cpu" {}
variable "memory" {}
variable "aws_region" {}
variable "service_name" {}
variable "desired_count" {}
variable "subnet_ids" {
  type = list(string)
}
variable "security_group_id" {}
variable "target_group_arn" {}
