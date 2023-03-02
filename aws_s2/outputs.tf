//output for s3 bucket url
output "aws_s3_bucket-url" {
  value = aws_s3_bucket.bucket.bucket_domain_name
  
}