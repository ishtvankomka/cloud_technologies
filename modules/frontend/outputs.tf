output "website_endpoint" {
  description = "Frontend endpoint"
  value       = aws_s3_bucket_website_configuration.frontend.website_endpoint
}
