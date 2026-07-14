# Story 18 – AWS Lambda Security Event Processor

## Overview

This project implements AWS Lambda as the serverless event processing engine for the Healthcare Landing Zone.

The Lambda function receives operational and security events from Amazon EventBridge, processes and enriches event data, logs execution details to Amazon CloudWatch Logs, and publishes structured notifications to Amazon SNS.

This implementation establishes the foundation for event-driven automation and future security remediation workflows using Infrastructure as Code (IaC) with Terraform.

---

# Business Value

Enterprise cloud environments generate continuous operational and security events that require rapid processing and response.

AWS Lambda provides a scalable serverless platform that enables organizations to:

- Process events in near real time
- Reduce operational overhead
- Eliminate server management
- Improve incident response
- Enable automated remediation
- Support security operations

---

# Business Requirement

**As a Cloud Security Engineer,** deploy AWS Lambda using Terraform so that operational and security events can be automatically processed, enriched, logged, and forwarded to downstream services for monitoring and incident response.

---

# Acceptance Criteria

- Create reusable Lambda Terraform module
- Deploy Lambda Function
- Deploy Lambda IAM Execution Role
- Configure least-privilege IAM permissions
- Integrate Amazon EventBridge
- Integrate Amazon SNS
- Export Terraform outputs
- Validate Terraform configuration
- Deploy successfully
- Create monitoring documentation

---

# Architecture

```text
CloudWatch Alarm
        │
        ▼
Amazon EventBridge
        │
        ▼
AWS Lambda
        │
        ▼
Amazon SNS
        │
        ▼
Email Notification
```

---

# Project Structure

```text
modules/
└── lambda/
    ├── main.tf
    ├── variables.tf
    └── outputs.tf

lambda/
└── security-event-processor/
    ├── lambda_function.py
    ├── requirements.txt
    └── README.md

infrastructure/
└── dev/
    └── aws/
        └── lambda.tf

monitoring/
└── lambda/
    ├── README.md
    ├── security-event-processor.md
    └── lambda-policy.md

docs/
└── stories/
    └── Story-18-AWS-Lambda.md
```

---

# Technologies Used

- Terraform
- AWS Lambda
- Amazon EventBridge
- Amazon SNS
- Amazon CloudWatch Logs
- IAM
- Python 3.12
- GitHub Actions

---

# Resources Implemented

## AWS Lambda Function

A serverless Python function processes incoming EventBridge events and forwards enriched notifications to Amazon SNS.

---

## IAM Execution Role

A dedicated IAM role provides the Lambda function with the permissions required to:

- Write logs to CloudWatch Logs
- Publish notifications to Amazon SNS

The implementation follows the Principle of Least Privilege.

---

## Lambda Permission

Configured Amazon EventBridge to invoke the Lambda function securely.

---

## CloudWatch Logs

Each Lambda execution is automatically logged to CloudWatch Logs, providing execution history, debugging information, and operational visibility.

---

# Event Processing Workflow

1. CloudWatch Alarm generates an event.
2. Amazon EventBridge receives the event.
3. EventBridge invokes the Lambda function.
4. Lambda extracts and formats event information.
5. Lambda publishes a structured notification to Amazon SNS.
6. Amazon SNS delivers an email notification to subscribed recipients.

---

# Terraform Validation

The deployment was validated using:

```bash
terraform fmt -recursive

terraform init

terraform validate

terraform plan -target=module.lambda

terraform apply -target=module.lambda
```

Deployment completed successfully and resources were verified in the AWS Management Console.

---

# Deployment Status

| Environment | Status |
|-------------|--------|
| Development | Deployed |
| Staging | Planned |
| Production | Planned |

---

# AWS Cost

| Resource | Cost Impact |
|----------|-------------|
| AWS Lambda | Pay per request and execution duration (minimal for development) |
| CloudWatch Logs | Charged based on log ingestion and storage |
| IAM | No additional cost |

This implementation is suitable for a development environment with minimal operating costs.

---

# Security Benefits

The Lambda solution provides:

- Serverless event processing
- Automated notification workflow
- Centralized event enrichment
- Secure IAM permissions
- CloudWatch logging
- Event-driven architecture
- Operational automation

---

# Integration

Current integrations include:

- Amazon EventBridge
- Amazon SNS
- Amazon CloudWatch Logs
- CloudWatch Alarms

Future integrations:

- AWS Config
- Amazon GuardDuty
- AWS Security Hub
- AWS WAF
- AWS Systems Manager
- AWS Step Functions

---

# Future Enhancements

Future improvements include:

- Automated security remediation
- Resource tag compliance enforcement
- Security Group validation
- GuardDuty finding enrichment
- Slack integration
- Microsoft Teams integration
- ServiceNow ticket creation
- Dead Letter Queue (DLQ)
- AWS X-Ray tracing

---

# Notes

Key implementation outcomes:

- Built a reusable Lambda Terraform module.
- Implemented least-privilege IAM permissions.
- Established a serverless event-processing pipeline.
- Integrated Lambda with EventBridge and Amazon SNS.
- Created a scalable foundation for automated cloud operations.

---

# Outcome

Successfully implemented AWS Lambda as the serverless event-processing engine for the Healthcare Landing Zone.

The solution now provides automated event processing, centralized logging, structured notifications, and establishes the foundation for future security automation and operational remediation workflows using an event-driven architecture.
