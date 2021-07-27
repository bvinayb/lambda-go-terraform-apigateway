resource "aws_iam_role" "go-lambda-role" {
  name               = "go-lambda-role"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": {
    "Action": "sts:AssumeRole",
    "Principal": {
      "Service": [
          "lambda.amazonaws.com",
          "apigateway.amazonaws.com"
        ]
    },
    "Effect": "Allow"
  }
}
POLICY
}

resource "aws_iam_policy" "go-lambda-policy" {
  name        = "go-lambda-policy"
  description = "Adds logging and S3 access"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach-logs" {
  role       = aws_iam_role.go-lambda-role.name
  policy_arn = aws_iam_policy.go-lambda-policy.arn
}

output "aws-iam-role-go-lambda-arn" {
  value = aws_iam_role.go-lambda-role.arn
}
