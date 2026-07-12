resource "aws_wafv2_web_acl" "this" {

  name  = var.web_acl_name
  scope = "REGIONAL"

  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = var.web_acl_name
    sampled_requests_enabled   = true
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
    Compliance  = "HIPAA"
  }
}
