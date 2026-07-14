module "eventbridge" {

  source = "../../../modules/eventbridge"

  rule_name = "${local.resource_prefix}-events"

  lambda_function_arn = module.lambda.lambda_function_arn

  remediation_lambda_arn = module.remediation.lambda_function_arn

  sns_topic_arn = module.sns.topic_arn

  tags = local.common_tags
}
