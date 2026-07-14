# Security Remediation Lambda

## Purpose

Detects insecure Amazon EC2 Security Group rules and publishes findings to Amazon SNS.

## Current Capabilities

- Reads Security Groups
- Detects SSH open to the Internet
- Detects RDP open to the Internet
- Publishes findings to SNS
- Logs execution to CloudWatch

## Future Enhancements

- Automatic rule removal
- Security Hub integration
- AWS Config integration
- Slack notifications
- ServiceNow integration
