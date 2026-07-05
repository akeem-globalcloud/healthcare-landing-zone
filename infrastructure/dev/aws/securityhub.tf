#############################################
# AWS Security Hub
#############################################

module "securityhub" {

  source = "../../../modules/securityhub"

  environment  = var.environment
  project_name = var.project_name
}
