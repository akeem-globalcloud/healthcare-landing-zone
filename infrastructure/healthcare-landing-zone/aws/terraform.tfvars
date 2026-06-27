aws_region = "us-east-1"

environment = "dev"

project_name = "healthcare"

kms_key_alias = "alias/aws/s3"

###################################################
# Story 1 Networking
###################################################

vpc_cidr                = "10.0.0.0/16"
public_subnet_cidr      = "10.0.1.0/24"
private_app_subnet_cidr = "10.0.2.0/24"
private_db_subnet_cidr  = "10.0.3.0/24"

availability_zone_index = 0

create_nat_gateway = false
