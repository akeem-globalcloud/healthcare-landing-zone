# Story 10 – Amazon Inspector Enterprise Vulnerability Management

## Description

**As a Cloud Security Engineer, I want to deploy Amazon Inspector using Infrastructure as Code so that EC2 instances and workloads are continuously assessed for software vulnerabilities, unintended network exposure, and security best practices, supporting proactive risk management and HIPAA-aligned security monitoring across the Healthcare Landing Zone.**

---

# Business Value

Healthcare organizations must continuously identify and remediate vulnerabilities before they can impact patient data or critical workloads.

Amazon Inspector provides automated vulnerability management by continuously scanning supported AWS resources and producing prioritized security findings.

Deploying Amazon Inspector with Terraform ensures vulnerability scanning is standardized, repeatable, and consistently enabled across environments.

---

# Objectives

- Deploy Amazon Inspector using Terraform
- Create reusable Inspector Terraform module
- Enable continuous vulnerability assessments
- Support EC2 workload scanning
- Support Amazon ECR image scanning
- Apply standardized resource tagging
- Export reusable outputs
- Support HIPAA-aligned vulnerability management

---

# Architecture

```
                    Amazon Inspector

                           │
           Continuous Vulnerability Assessment
                           │
         ┌─────────────────┼─────────────────┐
         │                 │                 │
         ▼                 ▼                 ▼
      EC2 Instances     ECR Images      Security Findings
                           │
                           ▼
                  Security Operations
```

---

# Project Structure

```
modules/
└── inspector/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    └── provider.tf

infrastructure/
└── dev/
    └── aws/
        ├── inspector.tf
        ├── outputs.tf
        ├── variables.tf
        └── terraform.tfvars
```

---

# Resources Deployed

This story provisions:

- Amazon Inspector V2
- EC2 Vulnerability Scanning
- Amazon ECR Image Scanning
- Enterprise Resource Tags
- Reusable Terraform Outputs

---

# Features Implemented

## Amazon Inspector

- Continuous vulnerability assessments
- Automated security findings
- Enterprise-ready Terraform module
- Environment-aware deployment

---

## Security Features

- Continuous vulnerability monitoring
- Workload security assessments
- Container image scanning
- Proactive risk identification
- Standardized governance approach

---

# Terraform Best Practices

Implemented throughout this story:

- Modular architecture
- Reusable Terraform module
- Parameterized deployment
- Environment-aware configuration
- Standardized outputs
- Future multi-account support

---

# Validation

Terraform

```bash
terraform fmt -recursive

terraform validate

terraform plan -target=module.inspector
```

AWS CLI

```bash
aws inspector2 list-findings
```

List enabled resource types

```bash
aws inspector2 batch-get-account-status
```

---

# AWS Console Validation

Validate the following resources:

- Amazon Inspector
- EC2 Scanning
- Amazon ECR Scanning
- Findings Dashboard
- Coverage
- Resource Types

---

# Outputs

| Output | Description |
|---------|-------------|
| account_id | AWS Account ID |
| resource_types | Enabled Inspector Resource Types |

---

# Technologies Used

- Terraform
- Amazon Inspector
- AWS IAM
- Amazon EC2
- Amazon ECR

---

# Security Benefits

- Continuous vulnerability management
- Automated security assessments
- Improved workload visibility
- Early detection of security risks
- Enterprise vulnerability management
- HIPAA-aligned security monitoring

---

# Future Enhancements

- EventBridge integration
- Lambda auto-remediation
- SNS notifications
- Security Hub integration
- Multi-account Inspector deployment
- Organization-wide delegated administrator

---

# Notes

- Continuous vulnerability management strengthens cloud security posture.
- Modular Terraform simplifies security service deployment.
- Amazon Inspector integrates naturally with enterprise security operations.
- Automated assessments reduce manual vulnerability management effort.

---

# Status

**Completed**

Successfully implemented a reusable Amazon Inspector Terraform module providing continuous vulnerability assessment capabilities and enterprise-ready infrastructure design for the Healthcare Landing Zone.
