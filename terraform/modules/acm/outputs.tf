
# output "certificate_status" {
#   value       = data.aws_acm_certificate.tm_subdomain.status
#   description = "Status of the ACM certificate"
# }

output "certificate_domain_name" {
  value       = aws_acm_certificate.cert.domain_name
  description = "Domain name of the ACM certificate"
}

output "certificate_status" {
  value       = aws_acm_certificate.cert.status
  description = "Status of the ACM certificate"
}