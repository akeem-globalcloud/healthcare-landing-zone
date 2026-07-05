module "vpc" {

  source = "../../../modules/vpc"

  environment  = var.environment
  project_name = var.project_name

  vpc_cidr                = var.vpc_cidr
  public_subnet_cidr      = var.public_subnet_cidr
  private_app_subnet_cidr = var.private_app_subnet_cidr
  private_db_subnet_cidr  = var.private_db_subnet_cidr

  availability_zone = data.aws_availability_zones.available.names[var.availability_zone_index]

  create_nat_gateway = var.create_nat_gateway
}
