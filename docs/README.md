# 🏥 Healthcare Landing Zone on AWS
### Enterprise Cloud Security, DevSecOps & Infrastructure Automation with Terraform

![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4?logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900?logo=amazonaws)
![Python](https://img.shields.io/badge/Python-Automation-3776AB?logo=python)
![GitHub Actions](https://img.shields.io/badge/GitHub-Actions-2088FF?logo=githubactions)
![License](https://img.shields.io/badge/License-MIT-green)

---

# Overview

The **Healthcare Landing Zone** is an enterprise-grade AWS cloud security platform designed using Infrastructure as Code (IaC) principles with Terraform.

This project demonstrates how to build, secure, monitor, and automate a production-style AWS environment by integrating networking, identity management, security services, monitoring, event-driven automation, and DevSecOps pipelines.

The architecture emphasizes:

- Security by Design
- Least Privilege
- Infrastructure as Code
- Event-Driven Automation
- Continuous Compliance
- Operational Visibility
- Cloud Governance

---

# Project Objectives

- Build a secure AWS Landing Zone
- Automate infrastructure deployment using Terraform
- Implement enterprise cloud security services
- Build reusable Terraform modules
- Implement DevSecOps CI/CD
- Centralize monitoring and logging
- Automate security operations
- Demonstrate production-ready cloud architecture

---

# Architecture

```text
                         Internet
                             │
                             ▼
                      AWS WAF / Shield
                             │
                             ▼
                          VPC Network
                             │
      ┌──────────────────────┼──────────────────────┐
      ▼                      ▼                      ▼
 IAM Governance        Security Services      Monitoring
      │                      │                      │
      ▼                      ▼                      ▼
 CloudTrail            GuardDuty           CloudWatch
 AWS Config            Security Hub             │
 KMS                   Inspector               ▼
 Secrets Manager                              EventBridge
 Systems Manager                               │
                                               ▼
                                          AWS Lambda
                                               │
                                               ▼
                                            Amazon SNS
                                               │
                                               ▼
                                       Email Notifications
```

---

# Repository Structure

```text
.
├── .github/
│   └── workflows/
├── docs/
│   ├── stories/
│   └── images/
├── infrastructure/
│   ├── dev/
│   ├── staging/
│   └── prod/
├── lambda/
├── modules/
├── monitoring/
├── security/
├── scripts/
└── README.md
```

---

# Stories Completed

| Story | Description | Status |
|--------|-------------|--------|
| Story 1 | Enterprise VPC & Networking | Completed |
| Story 2 | IAM Governance | Completed |
| Story 3 | AWS CloudTrail | Completed |
| Story 4 | AWS Config | Completed |
| Story 5 | Amazon GuardDuty | Completed |
| Story 6 | AWS Security Hub | Completed |
| Story 7 | AWS KMS | Completed |
| Story 8 | AWS Secrets Manager | Completed |
| Story 9 | AWS Systems Manager | Completed |
| Story 10 | Amazon Inspector | Completed |
| Story 11 | DevSecOps CI/CD Pipeline | Completed |
| Story 12 | AWS WAF | Completed |
| Story 13 | AWS Shield | Completed |
| Story 14 | AWS Firewall Manager | Completed |
| Story 15 | Amazon CloudWatch | Completed |
| Story 16 | Amazon SNS | Completed |
| Story 17 | Amazon EventBridge | Completed |
| Story 18 | AWS Lambda Event Processor | Completed |
| Story 19 | Automated Security Remediation | Completed |

---

# AWS Services Used

### Networking

- Amazon VPC
- Subnets
- Internet Gateway
- Route Tables

### Identity & Access

- AWS IAM
- IAM Roles
- IAM Policies

### Security

- AWS CloudTrail
- AWS Config
- Amazon GuardDuty
- AWS Security Hub
- AWS KMS
- AWS Secrets Manager
- AWS Systems Manager
- Amazon Inspector
- AWS WAF
- AWS Shield
- AWS Firewall Manager

### Monitoring

- Amazon CloudWatch
- Amazon SNS
- Amazon EventBridge

### Serverless

- AWS Lambda

### DevSecOps

- Terraform
- GitHub Actions
- Python

---

# Security Features

- Infrastructure as Code
- IAM Least Privilege
- Encryption using AWS KMS
- Continuous Compliance
- Threat Detection
- Vulnerability Assessment
- Centralized Monitoring
- Event-Driven Automation
- Security Notifications
- Automated Security Remediation

---

# Deployment

```bash

cd infrastructure/dev/aws

terraform init

terraform validate

terraform plan

terraform apply
```

---

# Project Documentation

Project documentation is organized under:

```text
docs/
```

Individual implementation stories are available under:

```text
docs/stories/
```

Monitoring documentation is available under:

```text
monitoring/
```

---

# DevSecOps Pipeline

GitHub Actions automatically performs:

- Terraform Format Check
- Terraform Validation
- Terraform Plan
- tfsec Security Scan

---

# Technologies

- Terraform
- AWS
- Python
- GitHub Actions
- Bash

---

# Learning Outcomes

This project demonstrates practical experience with:

- AWS Cloud Security
- Infrastructure as Code
- Terraform Module Design
- DevSecOps
- Event-Driven Architecture
- Serverless Computing
- Cloud Governance
- Security Automation
- Cloud Monitoring
- Enterprise Architecture

---

# Future Enhancements

- Terraform Remote Backend (S3 + DynamoDB)
- Multi-Environment Deployments
- AWS Backup
- Disaster Recovery
- Cost Optimization
- CloudWatch Dashboards
- AWS Organizations
- Service Control Policies
- Compliance Reporting

---

# Author

**A O Ogundipe**

Security & Infrastructure Engineer

Cloud Security • DevSecOps • Infrastructure Automation • Terraform • Python

---

# License

This project is licensed under the MIT License.
