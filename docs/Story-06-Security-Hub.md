# Story 6 – AWS Security Hub Integration

## Description

**As a Cloud Security Engineer, deploy AWS Security Hub using Infrastructure as Code so that security findings, compliance controls, and security standards are centralized across the Healthcare Landing Zone, improving visibility into the organization's security posture while supporting HIPAA compliance objectives.**

---

# Business Value

AWS Security Hub provides a centralized security management service that aggregates findings from AWS services and continuously evaluates cloud resources against industry security standards.

Deploying Security Hub with Terraform enables organizations to maintain consistent security monitoring, automate security governance, and simplify compliance management across cloud environments.

---

# Objectives

- Deploy AWS Security Hub using Terraform
- Enable AWS Foundational Security Best Practices
- Enable CIS AWS Foundations Benchmark
- Centralize security findings
- Apply reusable Terraform modules
- Remove hardcoded values
- Standardize resource tagging
- Support HIPAA security governance

---

# Architecture

```
                AWS Config
                     │
                CloudTrail
                     │
                GuardDuty
                     │
                     ▼
             AWS Security Hub
                     │
     ┌───────────────┼───────────────┐
     │               │               │
     ▼               ▼               ▼
 Security Findings  Compliance   Security Score
```

---

# Project Structure

```
modules/
└── securityhub/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    └── provider.tf

infrastructure/
└── dev/
    └── aws/
        ├── securityhub.tf
        ├── outputs.tf
        ├── variables.tf
        └── terraform.tfvars
```

---

# Features Implemented

## AWS Security Hub

- Security Hub Account
- Modular Terraform deployment
- Reusable infrastructure design
- Environment-aware configuration

---

## Security Standards

Enabled through Terraform:

- AWS Foundational Security Best Practices
- CIS AWS Foundations Benchmark

---

## Security Features

- Centralized security findings
- Continuous compliance monitoring
- Security standards management
- Standardized tagging
- Enterprise Infrastructure as Code

---

# Terraform Best Practices

Implemented throughout this story:

- Modular architecture
- Reusable module
- Environment parameterization
- No hardcoded AWS Region
- No hardcoded AWS Partition
- Standardized tagging
- Dynamic deployment

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

terraform plan
```

AWS CLI

```bash
aws securityhub describe-hub
```

List enabled standards

```bash
aws securityhub get-enabled-standards
```

---

# AWS Console Validation

Verify the following resources:

- AWS Security Hub Dashboard
- Security Standards
- Findings
- Security Score
- Compliance Controls
- Insights

---

# Outputs

| Output | Description |
|---------|-------------|
| securityhub_account_id | AWS Security Hub Account ID |

---

# Technologies Used

- Terraform
- AWS Security Hub
- AWS Config
- AWS CloudTrail
- Amazon GuardDuty

---

# Security Benefits

- Centralized security management
- Continuous compliance monitoring
- Security findings aggregation
- Best practice recommendations
- Improved governance
- Enhanced security visibility

---

# Future Enhancements

- Amazon Inspector Integration
- AWS Organizations Integration
- EventBridge Security Automation
- SNS Notifications
- Lambda Automated Remediation
- Security Hub Insights Automation

---

# Notes

- AWS Security Hub centralizes findings from multiple AWS security services.
- Modular Terraform design simplifies deployment across environments.
- Parameterized Infrastructure as Code improves maintainability and scalability.
- Standardized tagging strengthens governance and operational consistency.

---

# Status

**Completed**

Successfully implemented a reusable and modular AWS Security Hub deployment as part of the Healthcare Landing Zone security architecture.
