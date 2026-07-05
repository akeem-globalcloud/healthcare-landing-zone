#############################################
# AWS Secrets Manager Secret
#############################################

resource "aws_secretsmanager_secret" "this" {

  name = var.secret_name

  description = var.description

  kms_key_id = var.kms_key_id

  recovery_window_in_days = var.recovery_window_in_days

  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
    Compliance  = "HIPAA"
  }
}

#############################################
# Initial Secret Version
#############################################

resource "aws_secretsmanager_secret_version" "this" {

  secret_id = aws_secretsmanager_secret.this.id

  secret_string = var.secret_string
}
