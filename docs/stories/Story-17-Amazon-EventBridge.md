# Story 17 – Amazon EventBridge Enterprise Event Routing

## Overview

This project implements Amazon EventBridge as the centralized event routing service for the Healthcare Landing Zone.

Amazon EventBridge enables event-driven cloud operations by routing operational and security events between AWS services.

The implementation integrates CloudWatch with Amazon SNS and establishes the foundation for automated remediation using AWS Lambda.

---

# Business Value

Enterprise cloud environments generate thousands of operational and security events.

Amazon EventBridge enables organizations to:

- Centralize event routing
- Reduce operational latency
- Enable automation
- Improve incident response
- Build event-driven architectures

---

# Business Requirement

As a Cloud Security Engineer,

I want to deploy Amazon EventBridge

So that operational and security events can be automatically routed to downstream services.

---

# Acceptance Criteria

- Create reusable EventBridge module
- Deploy EventBridge Rule
- Deploy SNS Target
- Export Terraform outputs
- Validate Terraform
- Deploy infrastructure
- Create monitoring documentation
- Create routing policy

---

# Architecture

```text
CloudWatch
      │
      ▼
Amazon EventBridge
      │
      ▼
Amazon SNS
      │
      ▼
Email Notification
```

---

# Project Structure

```text
modules/
└── eventbridge/

infrastructure/
└── dev/
    └── aws/
        └── eventbridge.tf

monitoring/
└── eventbridge/
    ├── README.md
    ├── event-routing-policy.md
    └── event-patterns.md

docs/
└── stories/
    └── Story-17-Amazon-EventBridge.md
```

---

# Resources Implemented

## EventBridge Rule

Routes CloudWatch events into the Healthcare Landing Zone event bus.

---

## Event Target

Amazon SNS Topic

---

# Terraform Validation

Validated using:

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan -target=module.eventbridge
terraform apply -target=module.eventbridge
```

Resources were successfully deployed and verified in AWS.

---

# Deployment Status

| Environment | Status |
|------------|--------|
| Development | Deployed |
| Staging | Planned |
| Production | Planned |

---

# AWS Cost

| Resource | Cost Impact |
|---------|-------------|
| EventBridge Rule | Very low for development workloads |
| EventBridge Target | Minimal |

---

# Integration

Current:

- CloudWatch
- Amazon SNS

Future:

- AWS Lambda
- GuardDuty
- AWS Config
- Security Hub
- CloudTrail
- AWS WAF

---

# Event Flow

CloudWatch Alarm

↓

Amazon EventBridge

↓

Amazon SNS

↓

Email Notification

---

# Future Enhancements

- Lambda Auto Remediation
- Multi-target Routing
- Event Filtering
- Dead Letter Queues
- Event Archives
- Cross-account Event Routing

---

# Notes

- Built reusable EventBridge Terraform module.
- Implemented centralized event routing.
- Connected CloudWatch with Amazon SNS.
- Established the foundation for event-driven automation.

---

# Outcome

Successfully implemented Amazon EventBridge as the centralized event routing service for the Healthcare Landing Zone, enabling scalable event-driven operations and preparing the platform for automated remediation workflows.
