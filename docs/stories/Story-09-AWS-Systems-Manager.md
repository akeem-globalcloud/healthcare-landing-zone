# Story 9 – AWS Systems Manager Enterprise Operations

## Description

**As a Cloud Security Engineer, deploy AWS Systems Manager (SSM) using Infrastructure as Code so that EC2 instances can be securely managed without SSH access, reducing the attack surface while supporting HIPAA-aligned administrative access controls across the Healthcare Landing Zone.**

---

# Business Value

Healthcare environments require secure administration of compute resources while minimizing exposure to the public internet.

Traditional administration methods such as SSH, bastion hosts, and long-lived key pairs introduce operational overhead and security risks.

AWS Systems Manager provides secure instance management over HTTPS without requiring inbound SSH or RDP access, improving operational efficiency, auditability, and security.

Deploying AWS Systems Manager with Terraform standardizes instance management and establishes a reusable operational foundation for enterprise workloads.

---

# Objectives

- Deploy AWS Systems Manager using Terraform
- Create reusable SSM Terraform module
- Create IAM role for EC2 instances
- Attach AmazonSSMManagedInstanceCore policy
- Create EC2 Instance Profile
- Apply standardized resource tagging
- Export reusable outputs
- Support secure administrative access

---

# Architecture

```
                  AWS Systems Manager

                     Session Manager
                            │
                  Run Command / Inventory
                            │
                 IAM Instance Profile
                            │
                        Amazon EC2
                            │
              No SSH • No Bastion Host
```

---

# Project Structure

```
modules/
└── ssm/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    └── provider.tf

infrastructure/
└── dev/
    └── aws/
        ├── ssm.tf
        ├── outputs.tf
        ├── variables.tf
        └── terraform.tfvars
```

---

# Resources Deployed

This story provisions:

- IAM Role
- IAM Instance Profile
- AmazonSSMManagedInstanceCore Policy Attachment
- Enterprise Resource Tags
- Reusable Outputs

---

# Features Implemented

## AWS Systems Manager

- Session Manager foundation
- Secure instance administration
- IAM Instance Profile
- Reusable Terraform module

---

## IAM Integration

- EC2 IAM Role
- Managed Policy Attachment
- Least-Privilege Design

---

## Security Features

- Eliminates SSH dependency
- Removes bastion host requirement
- Secure HTTPS-based administration
- Standardized governance tags
- HIPAA-aligned operational controls

---

# Terraform Best Practices

Implemented throughout this story:

- Modular architecture
- Reusable Terraform module
- Environment-aware naming
- Parameterized deployment
- Standardized tagging
- Reusable outputs

---

# Validation

Terraform

```bash
terraform fmt -recursive

terraform validate

terraform plan -target=module.ssm
```

AWS CLI

```bash
aws iam list-instance-profiles
```

```bash
aws iam get-role \
--role-name <ssm-role-name>
```

---

# AWS Console Validation

Validate the following resources:

- AWS Systems Manager
- IAM Role
- Instance Profile
- Session Manager
- Managed Policies
- Tags

---

# Outputs

| Output | Description |
|---------|-------------|
| iam_role_name | IAM Role Name |
| instance_profile_name | EC2 Instance Profile |
| instance_profile_arn | Instance Profile ARN |

---

# Technologies Used

- Terraform
- AWS Systems Manager
- AWS IAM
- Amazon EC2

---

# Security Benefits

- Secure instance management
- No inbound SSH required
- Reduced attack surface
- Least-privilege access model
- Centralized operational management
- HIPAA-aligned administrative controls

---

# Future Enhancements

- Patch Manager
- State Manager
- Inventory
- Automation Documents
- Parameter Store
- Amazon Inspector Integration

---

# Notes

- Systems Manager eliminates the need for SSH in many operational scenarios.
- IAM Instance Profiles provide secure service-to-service authentication.
- Modular Terraform design simplifies operational management.
- Secure administration improves compliance and reduces operational risk.

---

# Status

**Completed**

Successfully implemented a reusable AWS Systems Manager module providing secure instance management, IAM integration, reusable outputs, and enterprise-ready Terraform design for the Healthcare Landing Zone.
