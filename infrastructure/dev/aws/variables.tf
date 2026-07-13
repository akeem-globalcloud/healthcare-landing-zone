variable "aws_region" {
  description = "AWS deployment region"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "kms_key_alias" {
  description = "KMS Alias"
  type        = string
  default     = "alias/aws/s3"
}

###################################################
# Story 1 - Networking
###################################################

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR"
  type        = string
}

variable "private_app_subnet_cidr" {
  description = "Private application subnet CIDR"
  type        = string
}

variable "private_db_subnet_cidr" {
  description = "Private database subnet CIDR"
  type        = string
}

variable "availability_zone_index" {
  description = "Availability Zone index"
  type        = number
  default     = 0
}

variable "create_nat_gateway" {
  description = "Whether to create a NAT Gateway"
  type        = bool
  default     = false
}


variable "enable_s3_protection" {
  type    = bool
  default = true
}

variable "enable_runtime_monitoring" {
  type    = bool
  default = true
}

variable "enable_malware_protection" {
  type    = bool
  default = true
}

variable "enable_eks_protection" {
  type    = bool
  default = false
}

#############################################
# AWS Secrets Manager
#############################################

variable "db_username" {
  description = "Healthcare database username"
  type        = string
}

variable "db_password" {
  description = "Healthcare database password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Healthcare database name"
  type        = string
}

variable "db_engine" {
  description = "Database engine"
  type        = string
}

variable "db_host" {
  description = "Database hostname"
  type        = string
}


#############################################
# Amazon SNS
#############################################

variable "alert_email" {
  description = "Email address for CloudWatch and security notifications"
  type        = string
}
