# Story 8 – AWS Secrets Manager Enterprise Secrets Management

## Description

**As a Cloud Security Engineer, I want to deploy AWS Secrets Manager using Infrastructure as Code so that application credentials, API keys, database passwords, and other sensitive information are securely stored, encrypted using customer-managed AWS KMS keys, and centrally managed across the Healthcare Landing Zone.**

---

# Business Value

Healthcare applications depend on highly sensitive credentials such as database passwords, API keys, service account credentials, and application secrets. Storing these values in configuration files or application code increases security risk and makes credential management difficult.

AWS Secrets Manager provides centralized secret storage, encryption using customer-managed AWS KMS keys, secure retrieval, auditability through AWS CloudTrail, and a foundation for automated secret rotation.

Deploying AWS Secrets Manager with Terraform ensures secure, repeatable, and standardized secrets management across environments.

---

# Objectives

- Deploy AWS Secrets Manager using Terraform
- Create a reusable Secrets Manager module
- Encrypt secrets using AWS KMS
- Store database credentials securely
- Remove hardcoded secrets
- Apply enterprise resource tagging
- Export reusable outputs
- Support HIPAA-aligned security practices

---

# Architecture

```
                      AWS KMS
                          │
               Customer Managed Key
                          │
                          ▼
              AWS Secrets Manager
                          │
        ┌─────────────────┼─────────────────┐
        │                 │                 │
        ▼                 ▼                 ▼
 Database Credentials   API Keys     Application Secrets
```

---

# Project Structure

```
modules/
└── secrets-manager/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    └── provider.tf

infrastructure/
└── dev/
    └── aws/
        ├── secrets_manager.tf
        ├── outputs.tf
        ├── variables.tf
        └── terraform.tfvars
```

---

# Resources Deployed

This story provisions:

- AWS Secrets Manager Secret
- Initial Secret Version
- Customer-managed AWS KMS encryption
- Enterprise resource tags
- Reusable Terraform outputs

---

# Features Implemented

## AWS Secrets Manager

- Secure secret storage
- JSON-formatted secret values
- Environment-aware naming
- Customer-managed KMS encryption
- Recovery window configuration

---

## AWS KMS Integration

- Customer-managed KMS key
- Centralized encryption management
- Reuse of Story 7 KMS module

---

## Security Features

- Centralized secrets management
- Encryption at rest
- Least-privilege design
- HIPAA-aligned encryption strategy
- Standardized governance tags

---

# Terraform Best Practices

Implemented throughout this story:

- Modular architecture
- Reusable Terraform module
- Parameterized deployment
- Environment-aware naming
- Standardized tagging
- No hardcoded AWS Account IDs
- Reusable outputs

---

# Validation

Terraform

```bash
terraform fmt -recursive

terraform validate

terraform plan -target=module.secrets_manager
```

AWS CLI

```bash
aws secretsmanager list-secrets
```

Describe the secret

```bash
aws secretsmanager describe-secret \
--secret-id <secret-name>
```

---

# AWS Console Validation

Validate the following resources:

- AWS Secrets Manager
- Secret Name
- KMS Encryption
- Secret Versions
- Tags

---

# Outputs

| Output | Description |
|---------|-------------|
| secret_id | Secret ID |
| secret_name | Secret Name |
| secret_arn | Secret ARN |

---

# Technologies Used

- Terraform
- AWS Secrets Manager
- AWS KMS
- AWS IAM

---

# Security Benefits

- Centralized secrets management
- Customer-managed encryption
- Elimination of hardcoded credentials
- Secure application integration
- HIPAA-aligned security controls

---

# Future Enhancements

- Automatic secret rotation
- Lambda rotation function
- Amazon RDS integration
- Amazon ECS integration
- Amazon EKS integration
- AWS Systems Manager integration

---

# Notes

- Secrets should never be hardcoded in infrastructure code.
- AWS KMS enables centralized encryption management.
- Parameterized Terraform modules improve reusability across environments.
- AWS Secrets Manager simplifies secure credential management for enterprise workloads.

---

# Status

**Completed**

Successfully implemented a reusable AWS Secrets Manager module with customer-managed AWS KMS encryption, reusable outputs, and enterprise-ready Terraform design for the Healthcare Landing Zone.
