module "eventbridge" {

  source = "../../../modules/eventbridge"

  rule_name = "${local.resource_prefix}-events"

  sns_topic_arn = module.sns.topic_arn

  tags = local.common_tags
}
