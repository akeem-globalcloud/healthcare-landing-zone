module "doctors_group" {
  source = "../../../modules/iam"

  environment = var.environment

  group_name = "Doctors"

  managed_policies_to_attach = [
    "arn:aws:iam::aws:policy/ReadOnlyAccess"
  ]

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

module "nurses_group" {
  source = "../../../modules/iam"

  environment = var.environment

  group_name = "Nurses"

  managed_policies_to_attach = [
    "arn:aws:iam::aws:policy/ReadOnlyAccess"
  ]
}

module "billing_group" {
  source = "../../../modules/iam"

  environment = var.environment

  group_name = "Billing"

  managed_policies_to_attach = [
    "arn:aws:iam::aws:policy/ReadOnlyAccess"
  ]
}

module "telehealth_group" {
  source = "../../../modules/iam"

  environment = var.environment

  group_name = "Telehealth"

  managed_policies_to_attach = [
    "arn:aws:iam::aws:policy/ReadOnlyAccess"
  ]
}

module "security_admins_group" {
  source = "../../../modules/iam"

  environment = var.environment

  group_name = "SecurityAdmins"

  managed_policies_to_attach = [
    "arn:aws:iam::aws:policy/SecurityAudit"
  ]
}
