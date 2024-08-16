output "bucket_name" {
  value = module.s3_bucket.bucket_name
}

output "access_point_arn" {
  value = module.s3_access_point.access_point_arn
}

output "object_lambda_access_point_arn" {
  value = module.object_lambda_access_point.object_lambda_access_point_arn
}
