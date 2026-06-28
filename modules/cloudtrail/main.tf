resource "aws_cloudtrail" "healthcare_cloudtrail" {
  name           = var.trail_name
  s3_bucket_name = var.s3_bucket_name

  include_global_service_events = true
  is_multi_region_trail         = true
  enable_logging                = true
  enable_log_file_validation    = true

  tags = {
    Name       = var.trail_name
    Project    = "Healthcare Landing Zone"
    Compliance = "HIPAA"
    ManagedBy  = "Terraform"
  }
}
