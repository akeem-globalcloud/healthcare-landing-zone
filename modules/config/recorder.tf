#############################################
# AWS Config Recorder
#############################################

resource "aws_config_configuration_recorder" "this" {

  name     = var.config_recorder_name
  role_arn = aws_iam_role.config_role.arn

  recording_group {
    all_supported                 = true
    include_global_resource_types = true
  }
}

#############################################
# Delivery Channel
#############################################

resource "aws_config_delivery_channel" "this" {

  name = "${var.config_recorder_name}-channel"

  s3_bucket_name = aws_s3_bucket.config_bucket.bucket

  depends_on = [
    aws_s3_bucket_policy.config_bucket
  ]
}

#############################################
# Recorder Status
#############################################

resource "aws_config_configuration_recorder_status" "this" {

  name       = aws_config_configuration_recorder.this.name
  is_enabled = true

  depends_on = [
    aws_config_delivery_channel.this
  ]
}
