output "zone_id" {
  description = "Zone ID of the hosted zone"
  value       = data.aws_route53_zone.selected.zone_id
}

output "subdomain_record_fqdn" {
  description = "FQDN of the subdomain created"
  value       = aws_route53_record.app.fqdn
}

output "app_url" {
  description = "Public URL of the app"
  value       = "https://${aws_route53_record.app.fqdn}"
}
