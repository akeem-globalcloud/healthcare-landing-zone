# Story 19 – AWS Lambda Automated Security Remediation

## Overview

This project implements an AWS Lambda–based automated security remediation solution for the Healthcare Landing Zone.

The solution detects insecure Amazon EC2 Security Group configurations, evaluates security findings, publishes notifications to Amazon SNS, and records execution logs in Amazon CloudWatch Logs.

The implementation extends the event-driven architecture established in previous stories by introducing automated security analysis using Infrastructure as Code (IaC) with Terraform.

---

# Business Value

Modern cloud environments require continuous security monitoring and rapid response to configuration drift and policy violations.

The automated remediation solution enables organizations to:

- Detect insecure Security Group configurations
- Reduce manual security investigations
- Improve incident response time
- Standardize security monitoring
- Enable event-driven security automation
- Strengthen governance and compliance

---

# Business Requirement

**As a Cloud Security Engineer,** deploy an automated security remediation solution using AWS Lambda so that security events can be evaluated automatically and findings can be reported to the operations team without manual intervention.

---

# Acceptance Criteria

- Create reusable Terraform remediation module
- Deploy remediation Lambda function
- Deploy IAM execution role
- Apply least-privilege permissions
- Integrate with Amazon EventBridge
- Integrate with Amazon SNS
- Export Terraform outputs
- Validate Terraform configuration
- Deploy successfully
- Create operational documentation

---

# Architecture

```text
CloudWatch Alarm
        │
        ▼
Amazon EventBridge
        │
        ├─────────────────────────┐
        ▼                         ▼
Security Event Processor   Security Remediation
       Lambda                    Lambda
            │                     │
            ▼                     ▼
     Amazon SNS           CloudWatch Logs
            │
            ▼
     Email Notification
```

---

# Project Structure

```text
modules/
└── remediation/
    ├── main.tf
    ├── variables.tf
    └── outputs.tf

lambda/
└── security-remediation/
    ├── lambda_function.py
    ├── requirements.txt
    └── README.md

infrastructure/
└── dev/
    └── aws/
        └── remediation.tf

monitoring/
└── remediation/
    ├── README.md
    ├── remediation-policy.md
    └── runbook.md

docs/
└── stories/
    └── Story-19-Automated-Security-Remediation.md
```

---

# Technologies Used

- Terraform
- AWS Lambda
- Amazon EventBridge
- Amazon SNS
- Amazon EC2
- Amazon CloudWatch Logs
- IAM
- Python 3.12
- GitHub Actions

---

# Resources Implemented

## AWS Lambda Remediation Function

A Python-based serverless function evaluates Security Group configurations and identifies insecure inbound access.

---

## IAM Execution Role

A dedicated IAM role provides the Lambda function with permissions to:

- Describe EC2 Security Groups
- Publish notifications to Amazon SNS
- Write execution logs to CloudWatch Logs

The implementation follows the Principle of Least Privilege.

---

## EventBridge Integration

Amazon EventBridge invokes the remediation Lambda whenever matching operational or security events are received.

Multiple EventBridge targets allow event processing and remediation to operate independently.

---

## CloudWatch Logs

Each remediation execution is automatically logged to Amazon CloudWatch Logs for auditing, troubleshooting, and operational visibility.

---

# Security Workflow

1. EventBridge receives a security event.
2. EventBridge invokes the remediation Lambda.
3. Lambda retrieves the specified Security Group.
4. Lambda evaluates inbound rules.
5. Lambda detects unrestricted SSH (22) or RDP (3389) access.
6. Lambda publishes findings to Amazon SNS.
7. Amazon SNS delivers notifications to subscribed recipients.
8. Lambda records execution details in CloudWatch Logs.

---

# Terraform Validation

The implementation was validated using:

```bash
terraform fmt -recursive

terraform init

terraform validate

terraform plan -target=module.remediation

terraform apply -target=module.remediation
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
| AWS Lambda | Minimal for development workloads |
| CloudWatch Logs | Pay for log ingestion and storage |
| IAM | No additional cost |

The deployed solution remains suitable for a low-cost development environment.

---

# Security Benefits

The remediation solution provides:

- Automated security inspection
- Continuous Security Group validation
- Least-privilege IAM implementation
- Event-driven security automation
- Centralized logging
- Operational visibility
- Security notification workflow

---

# Integration

Current integrations include:

- Amazon EventBridge
- AWS Lambda
- Amazon SNS
- Amazon CloudWatch Logs
- Amazon EC2

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

- Automatic removal of insecure Security Group rules
- Security Hub finding creation
- AWS Config remediation
- Slack integration
- Microsoft Teams integration
- ServiceNow incident creation
- Dead Letter Queue (DLQ)
- AWS X-Ray tracing
- Multi-account remediation

---

# Notes

Key implementation outcomes include:

- Built a reusable Terraform remediation module.
- Implemented serverless security automation.
- Applied least-privilege IAM permissions.
- Integrated Lambda with EventBridge and Amazon SNS.
- Established the foundation for automated cloud security operations.

---

# Outcome

Successfully implemented an automated security remediation solution using AWS Lambda for the Healthcare Landing Zone.

The solution detects insecure Security Group configurations, generates operational findings, integrates with the event-driven monitoring platform, and establishes a scalable foundation for future automated security remediation across AWS environments.
