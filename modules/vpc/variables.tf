variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidr" {
  type = string
}

variable "private_app_subnet_cidr" {
  type = string
}

variable "private_db_subnet_cidr" {
  type = string
}

variable "availability_zone" {
  type = string
}
