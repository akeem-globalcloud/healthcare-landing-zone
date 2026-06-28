# Story 5 – Amazon GuardDuty Threat Detection

## Description

**As a Cloud Security Engineer, deploy Amazon GuardDuty using Infrastructure as Code so that malicious activity, suspicious behavior, and potential security threats are continuously detected across the Healthcare Landing Zone while supporting HIPAA security monitoring requirements.**

---

# Business Value

Healthcare organizations must continuously monitor cloud environments for unauthorized access, malicious activity, compromised credentials, and suspicious behavior.

Amazon GuardDuty provides intelligent threat detection using machine learning, anomaly detection, and integrated AWS threat intelligence to improve the organization's security posture.

Deploying GuardDuty using Terraform ensures a repeatable, scalable, and standardized security deployment across multiple AWS environments.

---

# Objectives

* Deploy Amazon GuardDuty using Terraform
* Enable centralized threat detection
* Enable S3 Protection
* Enable Malware Protection
* Enable Runtime Monitoring
* Support EKS Audit Log Protection
* Remove hardcoded values
* Apply reusable Terraform modules
* Apply standardized resource tagging
* Produce environment-agnostic deployments

---

# Architecture

```
                  AWS CloudTrail
                         │
                  VPC Flow Logs
                         │
                    DNS Logs
                         │
                         ▼
               Amazon GuardDuty
                         │
        ┌────────────────┼────────────────┐
        │                │                │
        ▼                ▼                ▼
  S3 Protection   Runtime Monitoring   Malware Protection
                         │
                         ▼
               Security Findings
```

---

# Project Structure

```
modules/
└── guardduty/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    └── provider.tf

infrastructure/
└── healthcare-landing-zone/
    └── aws/
        ├── guardduty.tf
        ├── variables.tf
        ├── terraform.tfvars
        └── outputs.tf
```

---

# Features Implemented

## Amazon GuardDuty Detector

* Centralized GuardDuty detector
* Environment-aware deployment
* Terraform-managed lifecycle

---

## Threat Detection Features

* S3 Data Event Protection
* Runtime Monitoring
* Malware Protection
* EKS Audit Log Protection (parameterized)

---

## Security Features

* Continuous threat detection
* Centralized security monitoring
* HIPAA-aligned resource tagging
* Least-privilege deployment
* Modular Infrastructure as Code

---

# Terraform Best Practices

Implemented throughout this story:

* Modular architecture
* Reusable Terraform module
* Parameterized deployment
* Environment-specific configuration
* No hardcoded AWS Region
* No hardcoded Account ID
* Standardized tagging
* Dynamic resource naming

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
aws guardduty list-detectors
```

```bash
aws guardduty get-detector \
--detector-id <detector-id>
```

---

# AWS Console Validation

Validate the following resources within the AWS Management Console:

* Amazon GuardDuty Dashboard
* Detector
* Protection Plans
* Runtime Monitoring
* Malware Protection
* S3 Protection
* Findings Dashboard

---

# Outputs

| Output                | Description               |
| --------------------- | ------------------------- |
| guardduty_detector_id | GuardDuty Detector ID     |
| guardduty_status      | GuardDuty Detector Status |

---

# Technologies Used

* Terraform
* Amazon GuardDuty
* AWS IAM
* AWS CloudTrail
* Amazon S3

---

# Security Benefits

* Intelligent threat detection
* Continuous monitoring
* Malware detection
* Suspicious API activity monitoring
* S3 access monitoring
* Runtime threat detection
* Improved compliance visibility

---

# Future Enhancements

* AWS Security Hub Integration
* Amazon Detective Integration
* EventBridge Automation
* SNS Security Notifications
* Lambda Automated Remediation
* Multi-Account GuardDuty Administration

---

# Notes

* Amazon GuardDuty can be deployed using reusable Terraform modules for consistent security operations.
* Parameterized infrastructure improves portability across development, testing, and production environments.
* Modular Infrastructure as Code simplifies long-term maintenance and scalability.
* Standardized tagging improves governance, cost allocation, and operational management.

---

# Status

**Completed**

Successfully implemented a reusable, parameterized, and modular Amazon GuardDuty deployment as part of the Healthcare Landing Zone security architecture.
