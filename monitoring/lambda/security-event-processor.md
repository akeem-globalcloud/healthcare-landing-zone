# Security Event Processor

## Purpose

Processes operational and security events generated within the Healthcare Landing Zone.

---

## Responsibilities

- Receive EventBridge events
- Parse event payloads
- Extract relevant information
- Publish formatted notifications to Amazon SNS
- Log execution details to CloudWatch Logs

---

## Runtime

Python 3.12

---

## Output

- CloudWatch Logs
- Amazon SNS Notifications

---

## Future Enhancements

- Security remediation
- Tag compliance automation
- Security Group validation
- Incident ticket creation
