# Lambda Security Policy

## Purpose

Defines security requirements for Lambda functions.

---

## IAM

Functions must follow the principle of least privilege.

Current permissions:

- CloudWatch Logs
- SNS Publish

---

## Logging

All executions must be logged to Amazon CloudWatch Logs.

---

## Monitoring

Functions should be monitored using:

- CloudWatch Metrics
- CloudWatch Logs
- CloudWatch Alarms

---

## Future

- AWS X-Ray
- Dead Letter Queues
- Retry policies
