output "vpc_id" {
  value = aws_vpc.this.id
}

output "subnet_id" {
  value = aws_subnet.subnet1.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.gw.id
}

output "route_table_id" {
  value = aws_route_table.rt.id
}

output "security_group_id" {
  value = aws_security_group.main.id
}
