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
