output "cluster_id" {
  value = aws_ecs_cluster.this.id
}

output "service_name" {
  value = aws_ecs_service.this.name
}

output "task_definition_arn" {
  value = aws_ecs_task_definition.this.arn
}

# output "ecs_sg_id" {
#   value = aws_security_group.ecs_sg.id
# }

# output "subnet_ids" {
#   value = aws_subnet.this[*].id
  
# }