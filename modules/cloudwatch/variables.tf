variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "log_group_name" {
  description = "CloudWatch Log Group name"
  type        = string
}

variable "dashboard_name" {
  description = "CloudWatch Dashboard name"
  type        = string
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
}

variable "cpu_alarm_name" {
  description = "CPU utilization alarm name"
  type        = string
}

variable "sns_topic_arn" {
  description = "SNS topic ARN for alarm notifications"
  type        = string
  default     = ""
}
