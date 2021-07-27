resource "aws_lambda_function" "go-lambda" {
  for_each = local.lambdas

  filename         = "${path.module}/lambdas/archive/${each.key}.zip"
  function_name    = each.key
  description      = each.value.description
  role             = var.aws-iam-role-go-lambda-role-arn
  handler          = each.key
  publish          = false
  source_code_hash = data.archive_file.this[each.key].output_base64sha256
  runtime          = "go1.x"
  timeout          = "15"
  tags             = var.tags
}

resource "aws_lambda_permission" "go-lambda-permission" {
  action        = "lambda:InvokeFunction"
  statement_id  = "AllowAPIGatewayInvoke"
  function_name = aws_lambda_function.go-lambda.function_name
  principal     = "apigateway.amazonaws.com"
}
