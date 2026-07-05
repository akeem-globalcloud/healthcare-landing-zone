#############################################
# Data Sources
#############################################

data "aws_caller_identity" "current" {}

data "aws_partition" "current" {}

#############################################
# KMS Key Policy
#############################################

data "aws_iam_policy_document" "kms" {

  statement {

    sid = "EnableRootPermissions"

    effect = "Allow"

    principals {
      type = "AWS"

      identifiers = [
        "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:root"
      ]
    }

    actions = [
      "kms:*"
    ]

    resources = [
      "*"
    ]
  }
}

#############################################
# Customer Managed KMS Key
#############################################

resource "aws_kms_key" "this" {

  description = "${var.project_name} customer managed encryption key"

  enable_key_rotation = var.enable_key_rotation

  deletion_window_in_days = var.deletion_window_in_days

  policy = data.aws_iam_policy_document.kms.json

  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
    Compliance  = "HIPAA"
  }
}

#############################################
# KMS Alias
#############################################

resource "aws_kms_alias" "this" {

  name = "alias/${var.kms_key_alias}"

  target_key_id = aws_kms_key.this.key_id
}
