# Story 12 – AWS WAF Enterprise Web Application Firewall

## Overview

This project implements an enterprise-grade AWS Web Application Firewall (AWS WAF) using Terraform to protect healthcare web applications against common web exploits and malicious traffic.

The solution deploys a Regional Web ACL using Infrastructure as Code (IaC), providing a reusable and standardized security layer for internet-facing healthcare workloads.

The implementation aligns with enterprise cloud security best practices and supports HIPAA-aligned application security requirements.

---

# Business Value

Healthcare applications exposed to the Internet are frequent targets for cyberattacks including:

- SQL Injection (SQLi)
- Cross-Site Scripting (XSS)
- Remote Code Injection
- HTTP Flood attacks
- Bot traffic
- Credential stuffing
- Malicious IP addresses

AWS WAF provides a managed Layer 7 firewall that filters malicious requests before they reach application resources.

Benefits include:

- Protection against common web attacks
- Reduced attack surface
- Improved application security
- Centralized traffic inspection
- Support for compliance initiatives
- Infrastructure-as-Code deployment
- Standardized security controls

---

# Business Requirement

As a Cloud Security Engineer, deploy AWS WAF using Terraform so that healthcare web applications are protected against common web exploits while maintaining repeatable and secure infrastructure deployments.

---

# Acceptance Criteria

- Create reusable Terraform WAF module
- Deploy Regional Web ACL
- Configure default allow action
- Enable CloudWatch metrics
- Enable sampled requests
- Apply standardized resource tagging
- Export reusable outputs
- Validate Terraform configuration
- Document implementation

---

# Architecture

```text
                    Internet
                        │
                        ▼
                 AWS WAF Web ACL
                        │
        ┌─────────────────────────────────┐
        │ AWS Managed Rule Groups         │
        │                                 │
        │ • Common Rule Set               │
        │ • Known Bad Inputs              │
        │ • SQL Injection                 │
        │ • Linux Protection              │
        │ • Anonymous IP                  │
        └─────────────────────────────────┘
                        │
                        ▼
            Application Load Balancer
                        │
                        ▼
          Healthcare Web Application
```

---

# Project Structure

```
modules/
└── waf/
    ├── main.tf
    ├── variables.tf
    └── outputs.tf

infrastructure/
└── dev/
    └── aws/
        ├── waf.tf
        ├── outputs.tf
        ├── variables.tf
        └── terraform.tfvars

docs/
└── stories/
    └── Story-12-AWS-WAF.md

security/
└── policies/
    └── waf-policy.md
```

---

# Technologies Used

- Terraform
- AWS WAF v2
- AWS CloudWatch
- AWS Managed Rule Groups
- GitHub Actions
- DevSecOps

---

# Resources Implemented

## AWS WAF Web ACL

A Regional Web ACL provides centralized inspection of HTTP and HTTPS requests before they reach application resources.

---

## Default Action

Default behavior is configured to allow traffic while AWS Managed Rules evaluate requests.

---

## Visibility Configuration

CloudWatch metrics are enabled to support monitoring and operational visibility.

Sampled requests are enabled for traffic analysis and troubleshooting.

---

## Standardized Tagging

Resources inherit standardized enterprise tags:

- Environment
- Project
- ManagedBy
- Compliance

---

# Terraform Validation

The implementation was validated using:

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan -target=module.waf
```

The module successfully validated without syntax or dependency errors.

---

# Deployment Strategy

To avoid unnecessary AWS charges during development, the implementation was validated using Terraform planning rather than applying resources.

The module is deployment-ready and can be applied when enterprise testing or production deployment is required.

---

# Security Benefits

The implementation establishes the foundation for protecting web applications against:

- SQL Injection (SQLi)
- Cross-Site Scripting (XSS)
- Command Injection
- Known malicious inputs
- Automated attack traffic
- OWASP Top 10 web vulnerabilities

Future phases will extend protection using AWS Managed Rule Groups and custom security rules.

---

# Future Enhancements

Planned enhancements include:

- AWS Managed Rule Groups
- Rate-based rules
- IP reputation filtering
- Geographic restrictions
- Custom response bodies
- CloudWatch dashboards
- SNS alerting
- AWS Firewall Manager integration
- AWS Shield Advanced integration

---

# Lessons Learned

During implementation the following Terraform improvements were incorporated:

- Reused the project-wide `local.resource_prefix` naming convention
- Removed deprecated child provider configuration
- Standardized module outputs
- Followed reusable module design patterns established in previous stories

---

# Outcome

Successfully designed and validated an enterprise AWS WAF Terraform module that establishes the application security foundation for the Healthcare Landing Zone.

The implementation follows Infrastructure-as-Code best practices and provides a reusable, modular approach to deploying AWS WAF in enterprise cloud environments.