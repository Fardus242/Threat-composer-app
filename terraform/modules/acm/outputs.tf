output "certificate_arn" {
  description = "ARN of the existing issued ACM certificate"
  value       = data.aws_acm_certificate.main.arn
}

output "certificate_domain_name" {
  description = "Domain name of the existing ACM certificate"
  value       = data.aws_acm_certificate.main.domain  
}
