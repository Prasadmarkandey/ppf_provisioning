provider "aws" {
  region  = "us-east-2"
  profile = "default"
  shared_credentials_file = ".aws/credentials"
}



//creating bucket with an random name
resource "aws_s3_bucket" "bucket" {
  bucket = "PRASADBUCKET"
  acl = "public-read"
  versioning {
    enabled = false
  }
  tags = merge (var.tags, {
    Name        = "My Bucket"
    Environment = "Dev"
  })

}



//configure bucket policy
resource "aws_s3_bucket_policy" "default" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.default.json
}

data "aws_iam_policy_document" "default" {
  statement {
    actions = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.bucket.arn}/*"]
    principals {
      type = "AWS"
      identifiers = ["*"]
    }
  }
}
