#############################################
# AWS Security Hub
#############################################

resource "aws_securityhub_account" "this" {

  enable_default_standards = false
}

#############################################
# AWS Foundational Security Best Practices
#############################################

resource "aws_securityhub_standards_subscription" "aws_foundational" {

  standards_arn = "arn:${data.aws_partition.current.partition}:securityhub:${data.aws_region.current.name}::standards/aws-foundational-security-best-practices/v/1.0.0"

  depends_on = [
    aws_securityhub_account.this
  ]
}

#############################################
# CIS AWS Foundations Benchmark
#############################################

resource "aws_securityhub_standards_subscription" "cis" {

  standards_arn = "arn:${data.aws_partition.current.partition}:securityhub:${data.aws_region.current.name}::standards/cis-aws-foundations-benchmark/v/1.2.0"

  depends_on = [
    aws_securityhub_account.this
  ]
}

#############################################
# Data Sources
#############################################

data "aws_partition" "current" {}

data "aws_region" "current" {}
