#############################################
# Audit Bucket
#############################################

module "audit_logs_bucket" {

  source = "../../../modules/s3"

  bucket_name = local.audit_bucket_name

  kms_key_id = var.kms_key_alias

  logging_bucket_name = local.logging_bucket_name

  logging_kms_key_id = var.kms_key_alias

  s3_bucket_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {
        Sid    = "AWSCloudTrailWrite"
        Effect = "Allow"

        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }

        Action = "s3:PutObject"

        Resource = "arn:aws:s3:::${local.audit_bucket_name}/AWSLogs/${local.account_id}/*"

        Condition = {
          StringEquals = {
            "s3:x-amz-acl"  = "bucket-owner-full-control"
            "aws:SourceArn" = "arn:${local.partition}:cloudtrail:${local.region}:${local.account_id}:trail/${local.cloudtrail_name}"
          }
        }
      },

      {
        Sid    = "AWSCloudTrailAclCheck"
        Effect = "Allow"

        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }

        Action = "s3:GetBucketAcl"

        Resource = "arn:aws:s3:::${local.audit_bucket_name}"
      }

    ]

  })

}

#############################################
# CloudTrail
#############################################

module "cloudtrail" {

  source = "../../../modules/cloudtrail"

  trail_name     = local.cloudtrail_name
  s3_bucket_name = local.audit_bucket_name

  depends_on = [
    module.audit_logs_bucket
  ]
}
