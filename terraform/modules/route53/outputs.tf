output "zone_id" {
  description = "Zone ID of the hosted zone"
  value       = data.aws_route53_zone.selected.zone_id
}

output "record_fqdn" {
  description = "FQDN of the subdomain created"
  value       = aws_route53_record.subdomain.fqdn
}
