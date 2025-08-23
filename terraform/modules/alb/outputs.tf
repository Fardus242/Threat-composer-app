output "alb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.this.dns_name
}

output "alb_arn" {
  description = "ARN of the load balancer"
  value       = aws_lb.this.arn
}

# output "alb_sg_id" {
#   description = "Security group ID created for the ALB"
#   value       = aws_security_group.alb_sg.id
# }


output "target_group_arn" {
  description = "ARN of the target group"
  value       = aws_lb_target_group.this.arn
}

output "lb_dns_name" {
  value = aws_lb.this.dns_name
}

output "lb_zone_id" {
  value = aws_lb.this.zone_id
}

output "dns_name" {
  value = aws_lb.this.dns_name
}

# output "listener_arn" {
#   value       = aws_lb_listener.this.arn
# }

