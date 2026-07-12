module "shield" {

  source = "../../../modules/shield"

  environment  = var.environment
  project_name = var.project_name
}
