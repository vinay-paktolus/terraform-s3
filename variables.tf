variable "aws_region" {
  description = "The AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "aws_account_id" {
  description = "The AWS account ID where resources will be created"
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "vinay-new-bucket"
}

variable "access_point_name" {
  description = "The name of the S3 Access Point"
  type        = string
  default     = "vinay-new-access-point"
}

variable "object_lambda_name" {
  description = "The name of the S3 Object Lambda Access Point"
  type        = string
  default     = "vinay-new-object-lambda-ap"
}

variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
  default     = "vinay-new-object-lambda"
}

variable "lambda_runtime" {
  description = "The runtime environment for the Lambda function"
  type        = string
  default     = "nodejs20.x"
}

variable "lambda_handler" {
  description = "The function within your code that Lambda calls to begin execution"
  type        = string
  default     = "index.handler"
}

variable "lambda_zip_path" {
  description = "The path to the ZIP file containing the Lambda function code"
  type        = string
  default     = "lambda.zip"
}

variable "lambda_s3_permissions" {
  description = "The permissions for the Lambda function to access S3"
  type        = list(string)
  default     = ["s3:GetObject", "s3:ListBucket"]
}

variable "policy_name" {
  description = "The name of the IAM policy"
  type        = string
}

