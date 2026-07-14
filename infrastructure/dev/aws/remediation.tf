module "remediation" {

  source = "../../../modules/remediation"

  function_name = "${local.resource_prefix}-security-remediation"

  lambda_zip_path = "../../../lambda/security-remediation/function.zip"

  sns_topic_arn = module.sns.topic_arn

  tags = local.common_tags
}
