resource "aws_cloudwatch_event_rule" "security_events" {

  name        = var.rule_name
  description = "Healthcare Landing Zone Security Events"

  event_pattern = jsonencode({
    "source": [
      "aws.cloudwatch"
    ]
  })

  tags = var.tags
}

resource "aws_cloudwatch_event_target" "lambda" {

  rule = aws_cloudwatch_event_rule.security_events.name

  arn = var.lambda_function_arn
}
