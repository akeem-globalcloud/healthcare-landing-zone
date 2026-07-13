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

enable_s3_protection      = true
enable_runtime_monitoring = true
enable_malware_protection = true
enable_eks_protection     = false

#############################################
# AWS Secrets Manager
#############################################

db_username = "ehr_admin"

db_password = "ChangeMe123!"

db_name = "healthcare"

db_engine = "postgres"

db_host = "healthcare-db.internal"

#############################################
# Amazon SNS
#############################################

alert_email = "nogundipe03@gmail.com"
