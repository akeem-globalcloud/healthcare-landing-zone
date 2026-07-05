#############################################
# Amazon GuardDuty
#############################################

module "guardduty" {

  source = "../../../modules/guardduty"

  environment  = var.environment
  project_name = var.project_name

  enable_s3_protection      = var.enable_s3_protection
  enable_runtime_monitoring = var.enable_runtime_monitoring
  enable_malware_protection = var.enable_malware_protection
  enable_eks_protection     = var.enable_eks_protection
}
