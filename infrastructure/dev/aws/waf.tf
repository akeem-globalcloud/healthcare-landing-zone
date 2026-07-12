module "waf" {

  source = "../../../modules/waf"

  web_acl_name = "${local.resource_prefix}-waf"

  environment = var.environment

  project_name = var.project_name
}
