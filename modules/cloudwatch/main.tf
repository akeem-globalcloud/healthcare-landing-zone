resource "aws_cloudwatch_log_group" "this" {

  name              = var.log_group_name
  retention_in_days = 30

  tags = var.tags
}

resource "aws_cloudwatch_dashboard" "this" {

  dashboard_name = var.dashboard_name

  dashboard_body = jsonencode({

    widgets = [

      ###########################################################
      # Dashboard Title
      ###########################################################

      {
        "type" : "text",
        "x" : 0,
        "y" : 0,
        "width" : 24,
        "height" : 2,
        "properties" : {
          "markdown" : "# 🏥 Healthcare Landing Zone\n## Enterprise Cloud Monitoring Dashboard"
        }
      },

      ###########################################################
      # Monitoring Scope
      ###########################################################

      {
        "type" : "text",
        "x" : 0,
        "y" : 2,
        "width" : 24,
        "height" : 6,
        "properties" : {
          "markdown" : "## Monitoring Scope\n\nThis dashboard provides centralized visibility into the Healthcare Landing Zone infrastructure.\n\n### Current Monitoring\n- Infrastructure Monitoring\n- Security Monitoring\n- Compliance Monitoring\n- Audit Logging\n- Threat Detection\n- Encryption Services\n- DevSecOps Pipeline\n\n### Future Monitoring\n- EC2 Performance\n- Application Load Balancer\n- Amazon RDS\n- AWS WAF\n- AWS Lambda\n- Amazon SNS\n- Amazon EventBridge"
        }
      }

    ]

  })
}

###########################################################
# CPU Utilization Alarm
###########################################################

resource "aws_cloudwatch_metric_alarm" "cpu_high" {

  alarm_name          = var.cpu_alarm_name
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80

  alarm_description = "Alarm when EC2 CPU exceeds 80%"

  treat_missing_data = "notBreaching"

  actions_enabled = false

  tags = var.tags
}
