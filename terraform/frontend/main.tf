resource "aws_s3_bucket" "frontend-s3-bucket" {
  bucket = "eebottcamp-timesheet-frontend-server"
  region = var.AWS_REGION
  acl = "private"
  website {
    error_document = "error.html"
    index_document = "index.html"
    routing_rules = ""
  }
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_policy" "frontend-bucket-policy" {
  bucket = aws_s3_bucket.frontend-s3-bucket.bucket
  policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":\"*\",\"Action\":\"s3:GetObject\",\"Resource\":\"arn:aws:s3:::${aws_s3_bucket.frontend-s3-bucket.bucket}/*\"}]}"
}
