module "lambda" {

  source = "../../../modules/lambda"

  function_name = "${local.resource_prefix}-security-event-processor"

  lambda_zip_path = "../../../lambda/security-event-processor/function.zip"

  sns_topic_arn = module.sns.topic_arn

  tags = local.common_tags
}
