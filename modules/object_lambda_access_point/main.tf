resource "aws_s3control_object_lambda_access_point" "this" {
  name      = var.object_lambda_name

  configuration {
    supporting_access_point = var.supporting_access_point_arn

    transformation_configuration {
      actions = ["GetObject"]

      content_transformation {
        aws_lambda {
          function_arn = var.lambda_function_arn
        }
      }
    }
  }
}
