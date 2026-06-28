#############################################
# Data Sources
#############################################

data "aws_partition" "current" {}

#############################################
# AWS Config S3 Bucket
#############################################

resource "aws_s3_bucket" "config_bucket" {
  bucket = var.config_bucket_name

  tags = {
    Name        = var.config_bucket_name
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
    Compliance  = "HIPAA"
  }
}

#############################################
# Bucket Versioning
#############################################

resource "aws_s3_bucket_versioning" "config_bucket" {
  bucket = aws_s3_bucket.config_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

#############################################
# Bucket Encryption
#############################################

resource "aws_s3_bucket_server_side_encryption_configuration" "config_bucket" {
  bucket = aws_s3_bucket.config_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_key_alias
      sse_algorithm     = "aws:kms"
    }
  }
}

#############################################
# Public Access Block
#############################################

resource "aws_s3_bucket_public_access_block" "config_bucket" {
  bucket = aws_s3_bucket.config_bucket.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

#############################################
# AWS Config Service Role
#############################################

resource "aws_iam_role" "config_role" {

  name = var.config_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "config.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
    Compliance  = "HIPAA"
  }
}

#############################################
# AWS Managed Policy
#############################################

resource "aws_iam_role_policy_attachment" "config_role" {

  role = aws_iam_role.config_role.name

  policy_arn = "arn:${data.aws_partition.current.partition}:iam::aws:policy/service-role/AWS_ConfigRole"
}

#############################################
# AWS Config Bucket Policy
#############################################

resource "aws_s3_bucket_policy" "config_bucket" {

  bucket = aws_s3_bucket.config_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [

      {
        Sid    = "AWSConfigBucketPermissionsCheck"
        Effect = "Allow"

        Principal = {
          Service = "config.amazonaws.com"
        }

        Action = "s3:GetBucketAcl"

        Resource = aws_s3_bucket.config_bucket.arn
      },

      {
        Sid    = "AWSConfigBucketDelivery"
        Effect = "Allow"

        Principal = {
          Service = "config.amazonaws.com"
        }

        Action = "s3:PutObject"

        Resource = "${aws_s3_bucket.config_bucket.arn}/AWSLogs/*"

        Condition = {
          StringEquals = {
            "s3:x-amz-acl" = "bucket-owner-full-control"
          }
        }
      }
    ]
  })
}
