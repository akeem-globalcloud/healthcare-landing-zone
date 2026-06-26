#############################################
# Healthcare Audit Log Bucket
#############################################

module "audit_logs_bucket" {
  source = "../../../modules/s3"

  bucket_name = "dev-healthcare-audit-logs-597864876942"
  kms_key_id  = "alias/aws/s3"

  logging_bucket_name = "dev-healthcare-audit-logging-597864876942"
  logging_kms_key_id  = "alias/aws/s3"

  s3_bucket_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AWSCloudTrailWrite"
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action   = "s3:PutObject"
        Resource = "arn:aws:s3:::dev-healthcare-audit-logs-597864876942/AWSLogs/597864876942/*"

        Condition = {
          StringEquals = {
            "s3:x-amz-acl" = "bucket-owner-full-control"
          }
        }
      },
      {
        Sid    = "AWSCloudTrailAclCheck"
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action   = "s3:GetBucketAcl"
        Resource = "arn:aws:s3:::dev-healthcare-audit-logs-597864876942"
      }
    ]
  })
}

#############################################
# CloudTrail
#############################################

module "cloudtrail" {
  source = "../../../modules/cloudtrail"

  trail_name     = "dev-healthcare-cloudtrail"
  s3_bucket_name = "dev-healthcare-audit-logs-597864876942"
}
