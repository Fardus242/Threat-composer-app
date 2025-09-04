output "vpc_id" {
  value = aws_vpc.this.id
}


output "subnet_ids" {
  description = "List of subnet IDs"
  value = [
    aws_subnet.subnet1.id,
    aws_subnet.subnet2.id
  ]
}

output "internet_gateway_id" {
  value = aws_internet_gateway.gw.id
}

output "route_table_id" {
  value = aws_route_table.rt.id
}

output "alb_sg_id" {
  description = "The security group ID for the ALB"
  value       = aws_security_group.alb_sg.id
}


output "ecs_security_group_id" {
  value = aws_security_group.ecs.id
}

output "private_subnet_ids" {
  value = [aws_subnet.private1.id, aws_subnet.private2.id]
}

output "nat_gateway_id" {
  value = aws_nat_gateway.this.id
}
