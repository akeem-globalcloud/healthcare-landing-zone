variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "resource_types" {
  description = "Inspector resource types"

  type = list(string)

  default = [
    "EC2",
    "ECR"
  ]
}
