# Jira Story 1 – Secure AWS Healthcare Landing Zone Foundation

## Overview

This project implements a secure AWS healthcare landing zone using Terraform.

The architecture is designed to support:

* Electronic Health Record (EHR) systems
* Telehealth workloads
* AI-powered healthcare analytics
* Secure patient data processing

The solution follows Infrastructure as Code (IaC) principles and establishes a reusable cloud security foundation.

---

## Business Objective

Create a secure AWS networking baseline capable of supporting healthcare applications while enforcing network segmentation and security best practices.

---

## Architecture

AWS Healthcare Landing Zone

* VPC (10.0.0.0/16)
* Public Subnet
* Private Application Subnet
* Private Database Subnet
* Internet Gateway
* NAT Gateway

---

## Security Features

### Network Segmentation

Public Subnet:

* Internet-facing resources
* NAT Gateway

Private Application Subnet:

* Telehealth APIs
* Application services

Private Database Subnet:

* EHR systems
* Patient data storage

### Security Principles

* Least privilege architecture
* Private database isolation
* Controlled outbound connectivity
* Infrastructure modularization

---

## Terraform Structure

modules/

* vpc/

  * main.tf
  * variables.tf
  * outputs.tf

infrastructure/

* dev/

  * aws/

    * provider.tf
    * main.tf
    * variables.tf
    * outputs.tf
    * terraform.tfvars

---

## Validation

Terraform validation completed successfully.

Commands executed:

terraform fmt

terraform init

terraform validate

terraform apply

Result:

Success! The configuration is valid.

---

## Jira Story Details

Story Name:
Secure AWS Healthcare Landing Zone Foundation

Status:
Completed

Priority:
High

Outcome:
Established a reusable and secure AWS healthcare landing zone using Terraform.


##################################################################
# Story 1 Reviewed – Healthcare Landing Zone Networking
##################################################################

## Overview

This story provisions the foundational networking infrastructure for the Healthcare Landing Zone using reusable Terraform modules.

The implementation follows Infrastructure as Code (IaC) best practices by eliminating hardcoded resource names and supporting reusable deployments across multiple environments.

---

## Architecture

The deployment provisions:

- Virtual Private Cloud (VPC)
- Internet Gateway
- Public Subnet
- Private Application Subnet
- Private Database Subnet
- Optional NAT Gateway
- Consistent resource tagging

---

## Features

- Modular Terraform design
- Environment-aware resource naming
- Dynamic Availability Zone selection
- Optional NAT Gateway for cost optimization
- HIPAA-oriented tagging strategy
- Reusable across Dev, Test, Staging, and Production

---

## Variables

| Variable | Description |
|----------|-------------|
| environment | Deployment environment |
| project_name | Project name |
| vpc_cidr | VPC CIDR block |
| public_subnet_cidr | Public subnet |
| private_app_subnet_cidr | Application subnet |
| private_db_subnet_cidr | Database subnet |
| availability_zone_index | Availability Zone index |
| create_nat_gateway | Enable/Disable NAT Gateway |

---

## Deployment

```bash
terraform fmt -recursive

terraform validate

terraform plan

terraform apply
```

---

## Outputs

- VPC ID
- Public Subnet ID
- Private Application Subnet ID
- Private Database Subnet ID

---

## Design Improvements

This implementation removes hardcoded infrastructure values by using:

- Terraform variables
- AWS Availability Zone discovery
- Dynamic environment naming
- Reusable modules

---

## Cost Considerations

By default:

- NAT Gateway is disabled
- No recurring networking charges beyond provisioned resources

NAT Gateway can be enabled when private subnet internet access is required.

---

## Technologies

- Terraform
- AWS VPC
- Internet Gateway
- Subnets
- Route Tables
- Infrastructure as Code
