# Event Routing Policy

## Purpose

Defines how operational and security events are routed throughout the Healthcare Landing Zone.

---

## Current Flow

CloudWatch

↓

Amazon EventBridge

↓

Amazon SNS

↓

Email Notification

---

## Future Flow

CloudWatch

↓

Amazon EventBridge

↓

AWS Lambda

↓

Amazon SNS

↓

Operations Team

---

## Security Objectives

- Event standardization
- Near real-time processing
- Automated notifications
- Future automated remediation
