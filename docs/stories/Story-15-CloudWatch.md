# Story 15 – Amazon CloudWatch Enterprise Monitoring & Alerting

## Overview

This project implements Amazon CloudWatch as the centralized monitoring and observability platform for the Healthcare Landing Zone.

The solution provides enterprise-grade monitoring through CloudWatch Log Groups, Dashboards, and Metric Alarms, enabling proactive infrastructure monitoring, operational visibility, and incident detection.

The implementation follows Infrastructure-as-Code (IaC) best practices using Terraform and establishes the monitoring foundation for future alerting and automated remediation.

---

# Business Value

Healthcare environments require continuous monitoring to ensure system availability, detect operational issues, and support security investigations.

Amazon CloudWatch provides centralized monitoring that enables organizations to:

- Monitor infrastructure health
- Detect operational anomalies
- Improve incident response
- Support compliance reporting
- Centralize operational visibility
- Reduce downtime
- Enable proactive monitoring

---

# Business Requirement

As a Cloud Security Engineer,

I want to deploy Amazon CloudWatch using Terraform

So that healthcare infrastructure can be continuously monitored, operational events detected, and alerts generated to improve system reliability and security.

---

# Acceptance Criteria

- Create reusable CloudWatch Terraform module
- Deploy CloudWatch Log Group
- Deploy CloudWatch Dashboard
- Deploy CloudWatch Metric Alarm
- Apply standardized enterprise tagging
- Export reusable outputs
- Validate Terraform configuration
- Create monitoring documentation
- Create monitoring policy

---

# Architecture

```text
                    AWS Resources
                          │
                          ▼
                 Amazon CloudWatch
                          │
        ┌─────────────────┼─────────────────┐
        │                 │                 │
        ▼                 ▼                 ▼
  Log Groups        Dashboard        Metric Alarms
        │                                   │
        └─────────────────┬─────────────────┘
                          ▼
                 Future SNS Notifications
```

---

# Project Structure

```text
modules/
└── cloudwatch/
    ├── main.tf
    ├── variables.tf
    └── outputs.tf

infrastructure/
└── dev/
    └── aws/
        └── cloudwatch.tf

monitoring/
└── cloudwatch/
    ├── README.md
    ├── dashboards/
    │   └── healthcare-dashboard.md
    └── alarms/
        └── cpu-alarm.md

docs/
└── stories/
    └── Story-15-CloudWatch.md
```

---

# Technologies Used

- Terraform
- Amazon CloudWatch
- AWS CloudWatch Dashboard
- CloudWatch Log Groups
- CloudWatch Metric Alarms
- GitHub Actions
- AWS

---

# Resources Implemented

## CloudWatch Log Group

A centralized log group was deployed to collect application and infrastructure logs.

Configuration:

- 30-day log retention
- Enterprise tagging
- Terraform managed

---

## CloudWatch Dashboard

An enterprise monitoring dashboard provides centralized operational visibility.

Current dashboard sections include:

- Healthcare Landing Zone Overview
- Monitoring Scope
- Infrastructure Monitoring
- Security Monitoring
- Compliance Monitoring
- Audit Logging
- DevSecOps Pipeline

The dashboard is designed to grow as additional AWS services are integrated.

---

## CloudWatch Metric Alarm

A CPU utilization alarm monitors compute resources and detects excessive CPU usage.

Configuration:

- Namespace: AWS/EC2
- Metric: CPUUtilization
- Threshold: 80%
- Evaluation Periods: 2
- Period: 300 seconds

Alarm actions are intentionally disabled until Amazon SNS notification integration is implemented.

---

# Terraform Validation

The implementation was validated using:

```bash
terraform fmt -recursive

terraform init

terraform validate

terraform plan

terraform apply
```

Resources were successfully deployed and verified in the AWS Management Console.

---

# Deployment Status

| Environment | Status |
|-------------|--------|
| Development | Deployed |
| Staging | Planned |
| Production | Planned |

---

# AWS Cost

| Resource | Cost Impact |
|----------|-------------|
| CloudWatch Log Group | Low (based on log ingestion and storage) |
| CloudWatch Dashboard | Low for a development environment |
| CloudWatch Alarm | Low (per-alarm pricing) |

The deployed resources are appropriate for a development environment and provide enterprise monitoring capabilities with minimal operational cost.

---

# Monitoring Benefits

The CloudWatch implementation provides:

- Centralized infrastructure monitoring
- Operational dashboards
- Log management
- Performance monitoring
- Enterprise observability
- Foundation for automated alerting
- Improved operational visibility

---

# Integration with Previous Stories

CloudWatch complements previously implemented services by providing monitoring for:

- AWS CloudTrail
- AWS Config
- GuardDuty
- AWS Security Hub
- AWS KMS
- AWS WAF
- AWS Shield
- AWS Firewall Manager
- DevSecOps CI/CD Pipeline

---

# Future Enhancements

Planned enhancements include:

- Amazon SNS notifications
- EventBridge integration
- AWS Lambda automated remediation
- CloudWatch Log Insights
- Custom metrics
- Additional dashboards
- AWS WAF request metrics
- GuardDuty findings dashboard
- Compliance dashboard
- Infrastructure health dashboard

---

# Notes

Key implementation outcomes include:

- Established reusable CloudWatch Terraform module
- Introduced centralized enterprise monitoring
- Standardized resource tagging using common tags
- Implemented reusable dashboard architecture
- Prepared alarm infrastructure for future notification workflows

---

# Outcome

Successfully implemented an enterprise-grade Amazon CloudWatch monitoring solution for the Healthcare Landing Zone.

The solution provides centralized monitoring, operational dashboards, log management, and metric alarms while establishing the observability foundation for future alerting, automation, and operational excellence across the cloud environment.
