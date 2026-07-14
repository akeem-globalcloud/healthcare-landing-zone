variable "function_name" {
  description = "Lambda function name"
  type        = string
}

variable "lambda_zip_path" {
  description = "Path to Lambda deployment package"
  type        = string
}

variable "sns_topic_arn" {
  description = "SNS topic ARN"
  type        = string
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
}
