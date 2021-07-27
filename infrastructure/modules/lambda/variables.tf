variable "aws-iam-role-go-lambda-role-arn" {
    description = "IAM role ARN"
    type = string
}

variable "data-archive-file-placeholder-output-path" {
    description = "Placeholder content for Lambda"
    type = string
}

variable "lambda_layers_region" {
    description = "Lambda Layer Region"
    type = string
    default = "us-east-1"
}

variable "tags" {
    description = "A map of tags to add to all resources."
    type        = map(string)
}

variable "app_key" {
}

variable "template_bucket" {
}
