#############################################
# AWS Secrets Manager
#############################################

module "secrets_manager" {

  source = "../../../modules/secrets-manager"

  environment = var.environment

  project_name = var.project_name

  secret_name = "${var.environment}-${var.project_name}-ehr-db-credentials"

  description = "Healthcare database credentials"

  kms_key_id = module.kms.kms_key_arn

  secret_string = jsonencode({

    db_username = var.db_username

    db_password = var.db_password

    database = var.db_name

    engine = var.db_engine

    host = var.db_host

  })
}
