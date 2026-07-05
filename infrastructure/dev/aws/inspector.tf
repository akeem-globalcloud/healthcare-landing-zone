#############################################
# Amazon Inspector
#############################################

module "inspector" {

  source = "../../../modules/inspector"

  environment = var.environment

  project_name = var.project_name
}
