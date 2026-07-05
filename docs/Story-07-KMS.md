# Story 7 – AWS KMS Enterprise Encryption Strategy

## Description

**As a Cloud Security Engineer, deploy AWS Key Management Service (KMS) using Infrastructure as Code so that sensitive healthcare data is encrypted using customer-managed encryption keys, supporting HIPAA security requirements while enabling centralized encryption management across the Healthcare Landing Zone.**

---

# Business Value

Healthcare organizations manage highly sensitive Protected Health Information (PHI) that requires strong encryption and centralized key management.

AWS Key Management Service (KMS) enables organizations to control encryption keys, enforce enterprise security policies, and support regulatory compliance.

Deploying AWS KMS with Terraform ensures encryption resources are consistently provisioned, reusable across environments, and managed using Infrastructure as Code.

---

# Objectives

- Deploy AWS KMS using Terraform
- Create a customer-managed KMS key
- Enable automatic key rotation
- Create a reusable KMS alias
- Implement an enterprise key policy
- Apply standardized resource tagging
- Remove hardcoded values
- Export reusable outputs
- Support HIPAA-aligned encryption

---

# Architecture

```
                      AWS KMS
                          │
               Customer Managed Key
                          │
      ┌───────────────────┼───────────────────┐
      │                   │                   │
      ▼                   ▼                   ▼
 Amazon S3          AWS CloudTrail      AWS Config
      │                   │                   │
      └───────────────────┼───────────────────┘
                          │
                    Encrypted Resources
```

---

# Project Structure

```
modules/
└── kms/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    └── provider.tf

infrastructure/
└── healthcare-landing-zone/
    └── aws/
        ├── kms.tf
        ├── outputs.tf
        ├── variables.tf
        └── terraform.tfvars
```

---

# Resources Deployed

This story provisions the following resources:

- Customer Managed AWS KMS Key
- AWS KMS Alias
- Enterprise Key Policy
- Automatic Key Rotation
- Standardized Resource Tags

---

# Features Implemented

## AWS KMS Key

- Customer-managed encryption key
- Automatic key rotation enabled
- Configurable deletion window
- Enterprise key policy
- Dynamic AWS account detection

---

## AWS KMS Alias

- Human-readable alias
- Environment-aware naming
- Reusable across services

---

## Security Features

- Customer-managed encryption
- Centralized key management
- Least-privilege key policy
- Automatic key rotation
- HIPAA-aligned encryption strategy
- Standardized governance tags

---

# Terraform Best Practices

Implemented throughout this story:

- Modular architecture
- Reusable Terraform module
- Dynamic AWS account detection
- Dynamic AWS partition detection
- Parameterized deployment
- Environment-specific configuration
- Standardized tagging
- No hardcoded AWS Account IDs
- No hardcoded AWS Partition

---

# Deployment

Initialize Terraform

```bash
terraform init
```

Format configuration

```bash
terraform fmt -recursive
```

Validate configuration

```bash
terraform validate
```

Generate execution plan

```bash
terraform plan
```

Deploy infrastructure

```bash
terraform apply
```

---

# Validation

Terraform

```bash
terraform validate

terraform plan -target=module.kms
```

AWS CLI

```bash
aws kms list-keys
```

```bash
aws kms list-aliases
```

Describe the key

```bash
aws kms describe-key \
--key-id <kms-key-id>
```

---

# AWS Console Validation

Validate the following resources within the AWS Management Console:

- AWS KMS Dashboard
- Customer Managed Keys
- Key Rotation
- Key Policy
- Aliases
- Tags

---

# Outputs

| Output | Description |
|---------|-------------|
| kms_key_id | AWS KMS Key ID |
| kms_key_arn | AWS KMS Key ARN |
| kms_alias | AWS KMS Alias |

---

# Technologies Used

- Terraform
- AWS Key Management Service (KMS)
- AWS IAM

---

# Security Benefits

- Centralized encryption management
- Customer-managed encryption keys
- Automatic key rotation
- Secure key governance
- Fine-grained access control
- Auditability through AWS CloudTrail
- HIPAA-aligned encryption practices

---

# Future Enhancements

- Encrypt Amazon S3 buckets
- Encrypt AWS CloudTrail logs
- Encrypt AWS Config buckets
- Integrate with AWS Secrets Manager
- Encrypt Amazon EBS volumes
- Encrypt Amazon RDS databases
- Cross-account key sharing
- Multi-Region KMS keys

---

# Notes

- Customer-managed KMS keys provide greater control than AWS-managed keys.
- Automatic key rotation strengthens long-term key management.
- Dynamic account and partition detection improves module portability.
- Reusable Terraform modules simplify enterprise encryption deployments.
- Standardized tagging improves governance, auditing, and operational management.

---

# Status

**Completed**

Successfully implemented a reusable, parameterized, and enterprise-ready AWS KMS module to support centralized encryption across the Healthcare Landing Zone.
