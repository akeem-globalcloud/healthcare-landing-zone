variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "secret_name" {
  description = "Secrets Manager secret name"
  type        = string
}

variable "description" {
  description = "Secret description"
  type        = string
}

variable "kms_key_id" {
  description = "Customer-managed KMS Key ARN or ID"
  type        = string
}

variable "secret_string" {
  description = "JSON secret value"
  type        = string
}

variable "recovery_window_in_days" {
  description = "Recovery window before permanent deletion"
  type        = number
  default     = 7
}
