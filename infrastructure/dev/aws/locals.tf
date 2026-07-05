locals {

  account_id = data.aws_caller_identity.current.account_id

  region = data.aws_region.current.name

  partition = data.aws_partition.current.partition

  resource_prefix = "${var.environment}-${var.project_name}"

  readonly_policy_arn = "arn:${local.partition}:iam::aws:policy/ReadOnlyAccess"

  security_audit_policy_arn = "arn:${local.partition}:iam::aws:policy/SecurityAudit"

  audit_bucket_name = "${local.resource_prefix}-audit-logs-${local.account_id}"

  logging_bucket_name = "${local.resource_prefix}-audit-logging-${local.account_id}"

  cloudtrail_name = "${local.resource_prefix}-cloudtrail"

  #############################################
  # AWS Config
  #############################################

  config_bucket_name = "${local.resource_prefix}-config-${local.account_id}"

  config_role_name = "${local.resource_prefix}-config-role"

  config_recorder_name = "${local.resource_prefix}-config-recorder"

}
