output "frontend_url" {
  value = aws_s3_bucket.frontend-s3-bucket.website_endpoint
}
