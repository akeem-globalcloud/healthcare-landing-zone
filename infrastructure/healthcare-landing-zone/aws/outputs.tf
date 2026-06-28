#############################################
# VPC & SUBNET
#############################################

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "private_app_subnet_id" {
  value = module.vpc.private_app_subnet_id
}

output "private_db_subnet_id" {
  value = module.vpc.private_db_subnet_id
}

#############################################
# AWS Config
#############################################

output "config_bucket_name" {
  value = module.aws_config.config_bucket_name
}

output "config_role_arn" {
  value = module.aws_config.config_role_arn
}
