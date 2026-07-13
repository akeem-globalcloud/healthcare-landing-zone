# Story 11 – Enterprise DevSecOps CI/CD Pipeline

## Overview

This project implements an enterprise-grade DevSecOps Continuous Integration (CI) pipeline using GitHub Actions to automate Terraform validation, linting, and Infrastructure-as-Code (IaC) security scanning.

The pipeline automatically validates Terraform code, performs static analysis, and executes multiple security scanners before infrastructure changes can be merged or deployed.

This implementation demonstrates Infrastructure-as-Code governance, automated security validation, and DevSecOps best practices suitable for enterprise cloud environments.

---

# Business Value

Manual Terraform deployments introduce operational risks including:

- Human configuration errors
- Security misconfigurations
- Infrastructure drift
- Compliance violations
- Inconsistent code quality

Implementing an automated CI pipeline ensures every infrastructure change is validated before deployment.

Benefits include:

- Automated Terraform validation
- Infrastructure security scanning
- Code quality enforcement
- Early vulnerability detection
- Standardized deployment workflow
- Improved governance
- Reduced operational risk

---

# Business Requirement

As a Cloud Security Engineer,

I want to implement an enterprise DevSecOps CI pipeline

So that every Terraform change is automatically validated, analyzed, and security scanned before deployment.

---

# Acceptance Criteria

- Create GitHub Actions workflow
- Validate Terraform formatting
- Initialize Terraform
- Validate Terraform configuration
- Integrate TFLint
- Integrate tfsec
- Integrate Checkov
- Generate workflow reports
- Support Pull Requests and Push events
- Follow DevSecOps best practices

---

# Architecture

```text
                    Developer

                        │
                        ▼

             Git Push / Pull Request

                        │
                        ▼

                GitHub Actions

                        │
     ┌─────────────────────────────────────┐
     │ Checkout Repository                 │
     │                                     │
     │ Terraform fmt                       │
     │ Terraform init                      │
     │ Terraform validate                  │
     │                                     │
     │ TFLint                              │
     │ tfsec                               │
     │ Checkov                             │
     └─────────────────────────────────────┘
                        │
                        ▼

          Security Validation Results
```

---

# Project Structure

```
.github/
└── workflows/
    └── terraform-ci.yml

docs/
└── Story-11-DevSecOps-Pipeline.md

.tflint.hcl
```

---

# Technologies Used

- Terraform
- GitHub Actions
- TFLint
- tfsec
- Checkov
- YAML
- AWS

---

# Pipeline Stages

## Stage 1 – Terraform Formatting

```bash
terraform fmt -check -recursive
```

Ensures standardized Terraform formatting.

---

## Stage 2 – Terraform Initialization

```bash
terraform init
```

Initializes providers and modules.

---

## Stage 3 – Terraform Validation

```bash
terraform validate
```

Validates Terraform syntax and configuration.

---

## Stage 4 – TFLint

```bash
tflint
```

Performs Terraform linting and detects configuration issues.

---

## Stage 5 – tfsec

```bash
tfsec .
```

Performs Infrastructure-as-Code security scanning.

Example findings include:

- IAM wildcard permissions
- Missing encryption
- Public subnet configuration
- CloudTrail security recommendations

---

## Stage 6 – Checkov

```bash
checkov -d .
```

Performs policy and compliance scanning.

Checks include:

- Security best practices
- Compliance validation
- Infrastructure policy enforcement
- Misconfiguration detection

---

# Security Validation

The pipeline automatically checks for:

- Terraform syntax errors
- Formatting issues
- Infrastructure misconfigurations
- IAM policy risks
- Encryption settings
- Network security
- Compliance recommendations

---

# DevSecOps Benefits

- Automated validation
- Continuous security scanning
- Infrastructure governance
- Reduced deployment risk
- Consistent code quality
- Enterprise-ready CI/CD process

---

# Notes

During implementation, several CI/CD issues were identified and resolved:

- Terraform interactive input in GitHub Actions
- GitHub Actions YAML syntax corrections
- Terraform variable management
- AWS authentication considerations
- tfsec workflow integration
- Checkov policy validation

These improvements resulted in a reliable automated validation pipeline.

---

# Future Enhancements

Future improvements include:

- GitHub OIDC authentication
- Terraform Plan workflow
- Terraform Apply workflow
- Security report artifacts
- PR security comments
- Automated deployment approvals
- Multi-environment workflows
- Branch protection integration

---

# Outcome

Successfully implemented an enterprise DevSecOps pipeline capable of:

- Validating Terraform code
- Performing automated linting
- Executing Infrastructure-as-Code security scanning
- Enforcing Infrastructure-as-Code quality gates
- Supporting secure cloud infrastructure deployments

This pipeline establishes a strong DevSecOps foundation for the Healthcare Landing Zone project.
