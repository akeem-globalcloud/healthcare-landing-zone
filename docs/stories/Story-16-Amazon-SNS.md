# Story 16 – Amazon SNS Enterprise Notification Service

## Overview

This project implements Amazon Simple Notification Service (SNS) as the centralized notification platform for the Healthcare Landing Zone.

Amazon SNS enables CloudWatch alarms and future AWS security services to deliver real-time notifications to operations and security teams.

The implementation establishes the messaging foundation for automated incident response and event-driven cloud operations.

---

# Business Value

Monitoring systems are only effective when operational teams receive timely notifications.

Amazon SNS enables:

- Real-time email alerts
- Infrastructure notifications
- Security event notifications
- Event-driven automation
- Enterprise messaging

---

# Business Requirement

As a Cloud Security Engineer, deploy Amazon SNS using Terraform so that CloudWatch alarms and future AWS services can deliver centralized notifications.

---

# Acceptance Criteria

- Create reusable SNS Terraform module
- Deploy SNS Topic
- Deploy Email Subscription
- Export reusable outputs
- Integrate with CloudWatch
- Validate Terraform configuration
- Create monitoring documentation
- Create notification policy

---

# Architecture

```text
              CloudWatch Alarm
                     │
                     ▼
               Amazon SNS Topic
                     │
          ┌──────────┴──────────┐
          ▼                     ▼
     Email Notification    Future Lambda
```

---

# Project Structure

```text
modules/
└── sns/
    ├── main.tf
    ├── variables.tf
    └── outputs.tf

infrastructure/
└── dev/
    └── aws/
        └── sns.tf

monitoring/
└── sns/
    ├── README.md
    └── notification-policy.md

docs/
└── stories/
    └── Story-16-Amazon-SNS.md
```

---

# Resources Implemented

## SNS Topic

A centralized notification topic was deployed for operational and security messaging.

---

## Email Subscription

An email endpoint was configured to receive notifications.

The subscription must be confirmed before notifications are delivered.

---

# Terraform Validation

Validated using:

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
terraform apply
```

Resources were successfully deployed and verified in AWS.

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
| SNS Topic | Very low for development usage |
| Email Notifications | Pay per published message (minimal for low volume) |

---

# Integration

Amazon SNS currently integrates with:

- Amazon CloudWatch

Future integrations:

- Amazon EventBridge
- AWS Lambda
- GuardDuty
- Security Hub
- AWS Config
- AWS WAF

---

# Future Enhancements

- SMS Notifications
- Lambda Automation
- Slack Integration
- Microsoft Teams Integration
- PagerDuty
- ServiceNow
- EventBridge Routing

---

# Notes

- Built a reusable SNS Terraform module.
- Implemented centralized notification architecture.
- Prepared CloudWatch alarms for automated notifications.
- Established the messaging foundation for future automation.

---

# Outcome

Successfully implemented Amazon SNS as the enterprise notification service for the Healthcare Landing Zone, enabling centralized messaging and preparing the environment for event-driven automation and operational alerting.
