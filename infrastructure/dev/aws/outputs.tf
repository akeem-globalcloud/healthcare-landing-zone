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

#############################################
# GuardDuty
#############################################

output "guardduty_detector_id" {
  value = module.guardduty.guardduty_detector_id
}

output "guardduty_status" {
  value = module.guardduty.guardduty_status
}

#############################################
# Security Hub
#############################################

output "securityhub_account_id" {
  value = module.securityhub.securityhub_account_id
}

#############################################
# AWS KMS
#############################################

output "kms_key_id" {
  value = module.kms.kms_key_id
}

output "kms_key_arn" {
  value = module.kms.kms_key_arn
}

output "kms_alias" {
  value = module.kms.kms_alias
}


#############################################
# AWS Secrets Manager
#############################################

output "secret_arn" {
  value = module.secrets_manager.secret_arn
}

output "secret_name" {
  value = module.secrets_manager.secret_name
}

output "secret_id" {
  value = module.secrets_manager.secret_id
}

#############################################
# AWS Systems Manager
#############################################

output "ssm_role_name" {
  value = module.ssm.iam_role_name
}

output "ssm_instance_profile" {
  value = module.ssm.instance_profile_name
}

output "ssm_instance_profile_arn" {
  value = module.ssm.instance_profile_arn
}


#############################################
# Amazon Inspector
#############################################

output "inspector_account" {

  value = module.inspector.account_id

}

output "inspector_resource_types" {

  value = module.inspector.resource_types

}


#############################################
# AWS WAF
#############################################

output "waf_web_acl_id" {
  value = module.waf.web_acl_id
}

output "waf_web_acl_arn" {
  value = module.waf.web_acl_arn
}

#############################################
# AWS Shield
#############################################

output "shield_status" {
  value = module.shield.shield_protection
}

#############################################
# AWS Firewall Manager
#############################################

output "firewall_manager_status" {
  value = module.firewall_manager.firewall_manager_status
}

#############################################
# CloudWatch
#############################################

output "cloudwatch_log_group" {
  value = module.cloudwatch.log_group_name
}

output "cloudwatch_dashboard" {
  value = module.cloudwatch.dashboard_name
}

#############################################
# CloudWatch Alarm
#############################################

output "cpu_alarm_name" {
  value = module.cloudwatch.cpu_alarm_name
}
