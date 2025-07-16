output "certificate_arn" {
  description = "ARN of the ACM certificate"
  value       = aws_acm_certificate.cert.arn
}

output "certificate_domain_name" {
  description = "Domain name of the ACM certificate"
  value       = aws_acm_certificate.cert.domain_name
}

output "certificate_status" {
  description = "Status of the ACM certificate"
  value       = aws_acm_certificate.cert.status
}

output "certificate_validation_record_fqdns" {
  description = "Fully qualified domain names of the Route53 validation records"
  value       = [for record in aws_route53_record.cert_validation : record.fqdn]
}

output "certificate_validation_record_types" {
  description = "Record types of the Route53 validation records"
  value       = [for record in aws_route53_record.cert_validation : record.type]
}

output "certificate_validation_record_values" {
  description = "Record values of the Route53 validation records"
  value       = [for record in aws_route53_record.cert_validation : tolist(record.records)[0]]
}
