variable "function_name" {
  description = "Lambda function name"
  type        = string
}

variable "lambda_zip_path" {
  description = "Path to Lambda ZIP package"
  type        = string
}

variable "sns_topic_arn" {
  description = "SNS Topic ARN"
  type        = string
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
}
