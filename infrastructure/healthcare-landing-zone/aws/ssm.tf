#############################################
# AWS Systems Manager
#############################################

module "ssm" {

  source = "../../../modules/ssm"

  environment = var.environment

  project_name = var.project_name
}
