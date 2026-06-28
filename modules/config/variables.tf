variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "config_bucket_name" {
  description = "S3 bucket used by AWS Config"
  type        = string
}

variable "kms_key_alias" {
  description = "KMS alias for bucket encryption"
  type        = string
  default     = "alias/aws/s3"
}

variable "config_role_name" {
  description = "AWS Config IAM Role"
  type        = string
}

variable "config_recorder_name" {
  description = "AWS Config Recorder Name"
  type        = string
}
