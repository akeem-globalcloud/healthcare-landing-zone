module "sns" {

  source = "../../../modules/sns"

  topic_name = "${local.resource_prefix}-alerts"

  email_endpoint = var.alert_email

  tags = local.common_tags
}
