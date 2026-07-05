#############################################
# Doctors Group
#############################################

module "doctors_group" {
  source = "../../../modules/iam"

  environment  = var.environment
  project_name = var.project_name

  # Keep existing name to avoid recreation
  group_name = "Doctors"

  managed_policies_to_attach = [
    local.readonly_policy_arn
  ]

  # Keep existing policy name
  policy_name        = "DoctorsEHRAccess"
  policy_description = "Doctor access to healthcare resources"

  inline_policy_to_attach = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]

        Resource = "*"
      }
    ]
  })
}

#############################################
# Nurses Group
#############################################

module "nurses_group" {
  source = "../../../modules/iam"

  environment  = var.environment
  project_name = var.project_name

  group_name = "Nurses"

  managed_policies_to_attach = [
    local.readonly_policy_arn
  ]
}

#############################################
# Billing Group
#############################################

module "billing_group" {
  source = "../../../modules/iam"

  environment  = var.environment
  project_name = var.project_name

  group_name = "Billing"

  managed_policies_to_attach = [
    local.readonly_policy_arn
  ]
}

#############################################
# Telehealth Group
#############################################

module "telehealth_group" {
  source = "../../../modules/iam"

  environment  = var.environment
  project_name = var.project_name

  group_name = "Telehealth"

  managed_policies_to_attach = [
    local.readonly_policy_arn
  ]
}

#############################################
# Security Admins
#############################################

module "security_admins_group" {
  source = "../../../modules/iam"

  environment  = var.environment
  project_name = var.project_name

  group_name = "SecurityAdmins"

  managed_policies_to_attach = [
    local.security_audit_policy_arn
  ]
}
