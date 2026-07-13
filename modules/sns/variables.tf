variable "topic_name" {
  description = "SNS Topic Name"
  type        = string
}

variable "email_endpoint" {
  description = "Email address for notifications"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}
