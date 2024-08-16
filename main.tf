provider "aws" {
  region = var.aws_region
}

module "s3_bucket" {
  source      = "./modules/s3_bucket"
  bucket_name = var.bucket_name
}

module "s3_access_point" {
  source              = "./modules/s3_access_point"
  bucket_name         = module.s3_bucket.bucket_name
  access_point_name   = var.access_point_name
  
}
module "iam_role" {
  source             = "./modules/iam_role"
  role_name          = "${var.lambda_function_name}-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
  policy_name        = "lambda-s3-policy"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : var.lambda_s3_permissions,
        "Resource" : [
          "arn:aws:s3:::${module.s3_bucket.bucket_name}",
          "arn:aws:s3:::${module.s3_bucket.bucket_name}/*"
        ]
      }
    ]
  })
}

module "lambda_function" {
  source        = "./modules/lambda_function"
  function_name = var.lambda_function_name
  role_arn      = module.iam_role.role_arn
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime
  filename      = var.lambda_zip_path
  environment_variables = {
    S3_BUCKET = module.s3_bucket.bucket_name
  }
}

module "object_lambda_access_point" {
  source             = "./modules/object_lambda_access_point"
  object_lambda_name = var.object_lambda_name
  object_lambda_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : "*",
        "Action" : "s3-object-lambda:GetObject",
        "Resource" : "arn:aws:s3-object-lambda:${var.aws_region}:${var.aws_account_id}:accesspoint/${var.object_lambda_name}"
      }
    ]
  })
  supporting_access_point_arn = module.s3_access_point.access_point_arn
  lambda_function_arn         = module.lambda_function.function_arn
}
