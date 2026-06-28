#############################################
# AWS Config
#############################################

module "aws_config" {

  source = "../../../modules/config"

  environment  = var.environment
  project_name = var.project_name

  config_bucket_name = local.config_bucket_name

  config_role_name = local.config_role_name

  config_recorder_name = local.config_recorder_name

  kms_key_alias = var.kms_key_alias
}
