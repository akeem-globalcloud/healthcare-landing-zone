# Story 4 – AWS Config Continuous Compliance Monitoring

## Description

**As a Cloud Security Engineer, deploy AWS Config using Infrastructure as Code so that all supported AWS resources are continuously monitored for configuration compliance, security posture, and regulatory requirements within the Healthcare Landing Zone.**

---

# Business Value

Healthcare organizations operating in AWS must continuously monitor infrastructure to ensure compliance with HIPAA and internal security standards.

AWS Config provides continuous visibility into AWS resource configurations and evaluates them against predefined compliance rules, enabling rapid detection of configuration drift and policy violations.

---

# Objectives

- Deploy AWS Config using reusable Terraform modules
- Enable continuous configuration recording
- Store configuration history securely in Amazon S3
- Encrypt configuration snapshots using AWS KMS
- Enable bucket versioning
- Block all public access to configuration data
- Deploy AWS managed compliance rules
- Produce reusable Terraform modules with no environment-specific hardcoding

---

# Architecture

```
AWS Config
     │
     ▼
Configuration Recorder
     │
     ▼
Delivery Channel
     │
     ▼
Encrypted S3 Bucket
     │
     ▼
AWS Managed Config Rules
```

---

# Project Structure

```
infrastructure/
└── healthcare-landing-zone/
    └── aws/
        ├── config.tf
        ├── locals.tf
        ├── outputs.tf
        └── terraform.tfvars

modules/
└── config/
    ├── main.tf
    ├── recorder.tf
    ├── rules.tf
    ├── variables.tf
    └── outputs.tf
```

---

# Features Implemented

## AWS Config Recorder

- Configuration Recorder
- Delivery Channel
- Recording Status

---

## Secure S3 Configuration Bucket

- Server-Side Encryption (AWS KMS)
- Versioning Enabled
- Public Access Blocked
- Least-Privilege Bucket Policy

---

## IAM

Created dedicated IAM Role for AWS Config with:

- AWS Config Service Trust Policy
- AWS Managed Config Role Policy

---

## Compliance Rules

The following AWS Managed Rules were deployed:

| Rule | Purpose |
|------|---------|
| S3_BUCKET_SERVER_SIDE_ENCRYPTION_ENABLED | Ensures S3 buckets use encryption |
| S3_BUCKET_PUBLIC_READ_PROHIBITED | Prevents public read access |
| CLOUD_TRAIL_ENABLED | Verifies CloudTrail is enabled |
| ROOT_ACCOUNT_MFA_ENABLED | Ensures MFA is enabled on the root account |
| IAM_PASSWORD_POLICY | Validates account password policy |

---

# Security Features

- Continuous configuration recording
- Compliance monitoring
- Configuration history retention
- Secure S3 storage
- Encryption using AWS KMS
- Least-privilege IAM permissions
- Public access blocked
- HIPAA-aligned tagging strategy

---

# Terraform Best Practices

Implemented throughout this story:

- Reusable Terraform modules
- Parameterized deployment
- No hardcoded AWS Region
- No hardcoded Account ID
- Dynamic AWS Partition
- Dynamic resource naming
- Environment-specific configuration
- Centralized local variables
- Modular code organization

---

# Deployment

```bash
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply
```

---

# Validation

Terraform

```bash
terraform validate
terraform plan
```

AWS Config

```bash
aws configservice describe-configuration-recorders
```

Delivery Channel

```bash
aws configservice describe-delivery-channels
```

Recorder Status

```bash
aws configservice describe-configuration-recorder-status
```

Rules

```bash
aws configservice describe-config-rules
```

---

# AWS Console Validation

Verified in the AWS Console:

- AWS Config Dashboard
- Configuration Recorder
- Delivery Channel
- Compliance Dashboard
- AWS Managed Rules
- Evaluation Results

---

# Outputs

| Output | Description |
|---------|-------------|
| config_bucket_name | AWS Config S3 bucket |
| config_role_arn | IAM Role ARN used by AWS Config |

---

# Notes
- AWS Config requires a Configuration Recorder before compliance rules can evaluate resources.
- CloudTrail should be deployed before enabling the `CLOUD_TRAIL_ENABLED` managed rule.
- Versioned S3 buckets require all object versions and delete markers to be removed before deletion unless `force_destroy` is enabled.
- Explicit Terraform dependencies help ensure AWS resources are created in the correct order.

---

# Technologies Used

- Terraform
- AWS Config
- Amazon S3
- AWS IAM
- AWS KMS
- AWS Managed Config Rules

---

# Future Enhancements

- Custom AWS Config Rules
- AWS Config Conformance Packs
- SNS Notifications
- Security Hub Integration
- Automated Remediation with AWS Systems Manager Automation

---

# Status

**Completed**

Successfully deployed, validated, documented, and destroyed the AWS Config infrastructure using Terraform while maintaining a reusable, parameterized, and modular architecture.
