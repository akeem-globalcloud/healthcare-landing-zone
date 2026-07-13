module "cloudwatch" {

  source = "../../../modules/cloudwatch"

  environment  = var.environment
  project_name = var.project_name

  log_group_name = "${local.resource_prefix}-logs"

  dashboard_name = "${local.resource_prefix}-dashboard"

  cpu_alarm_name = "${local.resource_prefix}-cpu-high"

  sns_topic_arn = module.sns.topic_arn

  tags = local.common_tags
}
