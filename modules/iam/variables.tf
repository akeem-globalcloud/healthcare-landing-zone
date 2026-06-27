variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "group_name" {
  description = "IAM group name"
  type        = string
}

variable "managed_policies_to_attach" {
  description = "Managed IAM policy ARNs"
  type        = list(string)
  default     = []
}

variable "policy_name" {
  description = "Customer managed policy name"
  type        = string
  default     = null
}

variable "policy_description" {
  description = "Customer managed policy description"
  type        = string
  default     = null
}

variable "inline_policy_to_attach" {
  description = "JSON IAM policy"
  type        = string
  default     = null
}
