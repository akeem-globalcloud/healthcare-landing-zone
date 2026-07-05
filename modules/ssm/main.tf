#############################################
# IAM Role for AWS Systems Manager
#############################################

resource "aws_iam_role" "ssm_role" {

  name = "${var.environment}-${var.project_name}-ssm-role"

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }

    ]

  })

  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
    Compliance  = "HIPAA"
  }
}

#############################################
# AmazonSSMManagedInstanceCore
#############################################

resource "aws_iam_role_policy_attachment" "ssm_core" {

  role = aws_iam_role.ssm_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

#############################################
# EC2 Instance Profile
#############################################

resource "aws_iam_instance_profile" "ssm_profile" {

  name = "${var.environment}-${var.project_name}-ssm-profile"

  role = aws_iam_role.ssm_role.name
}
