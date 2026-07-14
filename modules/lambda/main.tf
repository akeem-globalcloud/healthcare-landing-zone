resource "aws_iam_role" "lambda_role" {

  name = "${var.function_name}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [{
      Effect = "Allow"

      Principal = {
        Service = "lambda.amazonaws.com"
      }

      Action = "sts:AssumeRole"
    }]
  })

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "basic_execution" {

  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy" "sns_publish" {

  name = "${var.function_name}-sns"

  role = aws_iam_role.lambda_role.id

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Action = [
          "sns:Publish"
        ]

        Resource = var.sns_topic_arn

      }

    ]

  })
}

resource "aws_lambda_function" "this" {

  function_name = var.function_name

  filename = var.lambda_zip_path

  source_code_hash = filebase64sha256(var.lambda_zip_path)

  runtime = "python3.12"

  handler = "lambda_function.lambda_handler"

  role = aws_iam_role.lambda_role.arn

  timeout = 30

  environment {

    variables = {

      SNS_TOPIC_ARN = var.sns_topic_arn

    }

  }

  tags = var.tags
}

resource "aws_lambda_permission" "allow_eventbridge" {

  statement_id = "AllowExecutionFromEventBridge"

  action = "lambda:InvokeFunction"

  function_name = aws_lambda_function.this.function_name

  principal = "events.amazonaws.com"
}
