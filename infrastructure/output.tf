output "api_url" {
  value = aws_api_gateway_stage.api.invoke_url
}

output "aws-iam-role-go-lambda-arn" {
  value = aws_iam_role.go-lambda-role.arn
}
