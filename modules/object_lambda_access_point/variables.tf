variable "object_lambda_name" {
  description = "The name of the S3 Object Lambda Access Point"
  type        = string
}

variable "object_lambda_policy" {
  description = "The policy for the S3 Object Lambda Access Point"
  type        = string
}

variable "supporting_access_point_arn" {
  description = "The ARN of the supporting S3 Access Point"
  type        = string
}

variable "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  type        = string
}
