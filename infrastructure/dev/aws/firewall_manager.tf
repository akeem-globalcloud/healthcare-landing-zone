module "firewall_manager" {

  source = "../../../modules/firewall-manager"

  environment  = var.environment
  project_name = var.project_name
}
