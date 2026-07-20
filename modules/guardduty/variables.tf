variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "enable_s3_protection" {
  description = "Enable S3 Protection"
  type        = bool
  default     = true
}

variable "enable_eks_protection" {
  description = "Enable EKS Audit Log Protection"
  type        = bool
  default     = false
}

variable "enable_runtime_monitoring" {
  description = "Enable Runtime Monitoring"
  type        = bool
  default     = true
}

variable "enable_malware_protection" {
  description = "Enable Malware Protection"
  type        = bool
  default     = true
}

