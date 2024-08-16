resource "aws_s3_access_point" "this" {
  bucket = var.bucket_name
  name   = var.access_point_name
  }


