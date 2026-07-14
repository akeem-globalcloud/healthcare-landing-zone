variable "rule_name" {
  type = string
}

variable "sns_topic_arn" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "lambda_function_arn" {
  description = "Lambda function ARN"
  type        = string
}

variable "remediation_lambda_arn" {
  description = "ARN of the remediation Lambda"
  type        = string
}
