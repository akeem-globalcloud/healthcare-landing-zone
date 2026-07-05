# Story 3: HIPAA Audit Logging & Compliance Monitoring

## Overview

This story implements centralized audit logging for the Healthcare Landing Zone using AWS CloudTrail and Amazon S3. The solution provides secure, encrypted, and immutable audit logs to support HIPAA compliance, governance, security monitoring, and forensic investigations.

---

## Business Requirement

As a Cloud Security Engineer, implement centralized audit logging so that all API activity across the AWS environment is securely captured, protected, and retained for compliance audits and incident response.

---

## Objectives

* Centralize AWS API activity logging
* Protect audit logs from unauthorized access
* Encrypt audit data at rest
* Enable log integrity validation
* Support HIPAA audit requirements
* Build reusable Terraform modules

---

## Architecture

```text
                    AWS Account
                         │
                  AWS CloudTrail
                         │
               Multi-Region Trail
                         │
      ┌──────────────────┴──────────────────┐
      │                                     │
Audit Log Bucket                 Logging Bucket
(S3 + KMS Encryption)           (S3 + Versioning)
      │                                     │
      ├── Versioning Enabled                │
      ├── Public Access Block               │
      ├── Bucket Policy                     │
      └── Server-Side Encryption            │
```

---

## Terraform Modules

### Reusable Modules

```text
modules/
├── cloudtrail/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
└── s3/
    ├── main.tf
    ├── s3_bucket_logging.tf
    ├── variables.tf
    └── provider.tf
```

---

## Infrastructure Deployment

```text
infrastructure/
└── healthcare-landing-zone/
    └── aws/
        ├── logging.tf
        ├── provider.tf
        ├── variables.tf
        ├── outputs.tf
        └── terraform.tfvars
```

---

## AWS Resources Created

### Amazon S3

Primary Audit Bucket

* dev-healthcare-audit-logs-597864876942

Logging Bucket

* dev-healthcare-audit-logging-597864876942

Security Features

* Server-side encryption (AWS KMS)
* Bucket versioning
* Block Public Access
* Server access logging
* CloudTrail bucket policy

---

### AWS CloudTrail

Trail Name

* dev-healthcare-cloudtrail

Configuration

* Multi-Region Trail
* Management Event Logging
* Log File Validation Enabled
* Secure delivery to Amazon S3

---

## Security Controls

* Least-privilege bucket policy
* KMS encryption for audit logs
* Versioning enabled for log protection
* Public access blocked
* Centralized audit log storage
* Log integrity validation
* Multi-region monitoring

---

## Validation

Terraform commands executed successfully:

```bash
terraform fmt
terraform init
terraform validate
```

Result:

```text
Success! The configuration is valid.
```

---

## Deployment

Story 3 was deployed independently using targeted Terraform deployment.

```bash
terraform apply \
-target=module.audit_logs_bucket \
-target=module.cloudtrail
```

Deployment Result

```text
Apply complete!
Resources: 2 added, 0 changed, 0 destroyed.
```

---

## AWS Console Verification

### CloudTrail

Verified:

* Logging enabled
* Multi-region trail enabled
* Log file validation enabled
* Audit logs delivered to Amazon S3

### Amazon S3

Verified:

* Audit bucket created
* Logging bucket created
* Versioning enabled
* Encryption enabled
* Public access blocked

---

## Skills Demonstrated

* Terraform Infrastructure as Code (IaC)
* AWS CloudTrail
* Amazon S3
* AWS KMS Encryption
* IAM Policy Management
* Security Logging
* Compliance Automation
* HIPAA Security Controls
* Cloud Governance
* Infrastructure Security

---

## Business Value

This solution provides centralized audit logging for healthcare workloads, enabling security monitoring, regulatory compliance, forensic investigations, and operational governance. The modular Terraform implementation supports reusable, scalable, and production-ready cloud security deployments.

---

## Future Enhancements

* AWS Config
* AWS Security Hub
* Amazon GuardDuty
* AWS Config Rules
* CloudWatch Alarms
* SNS Security Notifications
* SIEM Integration
* Automated Compliance Reporting

---

## Author

**A.O Ogundipe**

Security & Infrastructure Engineer | DevSecOps | Cloud Security | Terraform | AWS


########################################################
# Story 3 Reviewed – Audit Logging
########################################################

## Overview

This story provisions centralized audit logging for the Healthcare Landing Zone using Amazon S3 and AWS CloudTrail.

The implementation captures management events across the AWS environment and stores encrypted audit logs for compliance and security monitoring.

---

## Architecture

The deployment provisions:

- Audit S3 Bucket
- Logging S3 Bucket
- Bucket Encryption
- Bucket Versioning
- Bucket Logging
- Bucket Policy
- AWS CloudTrail

---

## Features

- Dynamic AWS Account ID discovery
- Dynamic AWS Region discovery
- Dynamic AWS Partition support
- Reusable bucket naming
- Customer-defined environments
- Server-side encryption
- Bucket versioning
- Server access logging

---

## Security

The deployment includes:

- SSE-KMS encryption
- Bucket versioning
- Public access block
- CloudTrail bucket policy
- CloudTrail log validation

---

## Variables

| Variable | Description |
|----------|-------------|
| environment | Deployment environment |
| project_name | Project name |
| kms_key_alias | KMS Key Alias |

---

## Dynamic Resource Naming

Bucket names are generated automatically using:

```
<environment>-<project>-audit-logs-<account-id>

<environment>-<project>-audit-logging-<account-id>
```

Example:

```
dev-healthcare-audit-logs-597864876942
```

No AWS Account IDs are hardcoded.

---

## Deployment

```bash
terraform fmt -recursive

terraform validate

terraform plan

terraform apply
```

---

## Design Improvements

This implementation removes hardcoded infrastructure values by using:

- aws_caller_identity
- aws_region
- aws_partition
- Terraform locals
- Environment variables
- Project variables

The solution also removes legacy S3 ACL resources in favor of modern AWS S3 security best practices.

---

## Compliance

Designed to support:

- HIPAA
- Security auditing
- Operational monitoring
- Infrastructure governance

---

## Technologies

- Terraform
- Amazon S3
- AWS CloudTrail
- AWS KMS
- Infrastructure as Code
- Cloud Security
