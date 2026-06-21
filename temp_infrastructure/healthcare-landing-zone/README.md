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

* healthcare-landing-zone/

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
