resource "aws_config_config_rule" "s3_bucket_encryption" {

  name = "${var.environment}-${var.project_name}-s3-bucket-encryption"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_SERVER_SIDE_ENCRYPTION_ENABLED"
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
    Compliance  = "HIPAA"
  }

  depends_on = [
    aws_config_configuration_recorder.this
  ]
}


resource "aws_config_config_rule" "s3_public_read" {

  name = "${var.environment}-${var.project_name}-s3-public-read"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_PUBLIC_READ_PROHIBITED"
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
    Compliance  = "HIPAA"
  }

  depends_on = [
    aws_config_configuration_recorder.this
  ]
}


resource "aws_config_config_rule" "cloudtrail_enabled" {

  name = "${var.environment}-${var.project_name}-cloudtrail-enabled"

  source {
    owner             = "AWS"
    source_identifier = "CLOUD_TRAIL_ENABLED"
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
    Compliance  = "HIPAA"
  }

  depends_on = [
    aws_config_configuration_recorder.this
  ]
}


resource "aws_config_config_rule" "root_mfa" {

  name = "${var.environment}-${var.project_name}-root-mfa"

  source {
    owner             = "AWS"
    source_identifier = "ROOT_ACCOUNT_MFA_ENABLED"
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
    Compliance  = "HIPAA"
  }

  depends_on = [
    aws_config_configuration_recorder.this
  ]
}


resource "aws_config_config_rule" "iam_password_policy" {

  name = "${var.environment}-${var.project_name}-iam-password-policy"

  source {
    owner             = "AWS"
    source_identifier = "IAM_PASSWORD_POLICY"
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
    Compliance  = "HIPAA"
  }

  depends_on = [
    aws_config_configuration_recorder.this
  ]
}
