# DevSecOpsCI-CD

Enterprise-grade DevSecOps and Cloud Security engineering repository focused on secure infrastructure automation, compliance, CI/CD, and healthcare cloud security.

This repository demonstrates real-world cloud security engineering practices for securing AI-driven healthcare systems, telehealth services, predictive analytics workloads, and Electronic Health Record (EHR) platforms.

---

## Project Objectives

* Build secure cloud infrastructure using Terraform
* Implement DevSecOps CI/CD pipelines
* Enforce least privilege IAM controls
* Perform infrastructure security scanning
* Support HIPAA-aligned cloud security practices
* Automate cloud security remediation
* Secure telehealth and healthcare data workloads

---

## Repository Structure

```text
DevSecOpsCI-CD/
├── cicd/               # CI/CD pipelines
├── configs/            # Environment configurations
├── docs/               # Architecture and setup docs
├── infrastructure/     # Terraform infrastructure
├── modules/            # Reusable Terraform modules
├── monitoring/         # Cloud monitoring solutions
├── scripts/            # Automation scripts
├── security/           # Security controls and scanning
└── tests/              # Security and integration tests
```

---

## Current Projects

### 1. Healthcare Landing Zone (Completed)

**Objective:**
Provision a secure AWS healthcare landing zone for telehealth systems, predictive analytics, and EHR environments.

**Implemented Components**

* Secure VPC
* Public subnet
* Private application subnet
* Private database subnet
* Internet Gateway
* NAT Gateway
* Terraform modularization
* Environment-aware configuration

**Security Focus**

* Network segmentation
* Least privilege design
* Secure outbound access
* Healthcare-ready architecture
* HIPAA-aligned infrastructure baseline

---

## Technologies Used

* Terraform
* AWS
* GitHub Actions
* DevSecOps
* tfsec
* Checkov
* Python
* Bash
* Cloud Security Engineering

---

## Terraform Workflow

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

---

## Git Workflow

```bash
git checkout dev
git pull origin dev
git add .
git commit -m "meaningful commit message"
git push
```

---

## Jira Story Progress

| Story                                         | Status      |
| --------------------------------------------- | ----------- |
| Secure AWS Healthcare Platform Landing Zone Foundation | Completed |

---

## Author

**Akeem Ogundipe**
Cloud Security Engineer | DevSecOps | Terraform | AWS | Infrastructure Security
