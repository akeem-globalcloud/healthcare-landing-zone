#############################################
# AWS KMS
#############################################

module "kms" {

  source = "../../../modules/kms"

  environment = var.environment

  project_name = var.project_name

  kms_key_alias = "${var.environment}-${var.project_name}"
}
