resource "aws_lambda_function" "this" {
  function_name = var.function_name
  role          = var.role_arn
  handler       = var.handler
  runtime       = var.runtime
  filename      = var.filename

  source_code_hash = filebase64sha256(var.filename)

  environment {
    variables = var.environment_variables
  }
}
