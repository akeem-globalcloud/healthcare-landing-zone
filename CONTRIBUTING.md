# Contributing

Thank you for your interest in contributing to the Healthcare Landing Zone project.

## Overview

This repository demonstrates enterprise AWS cloud security, infrastructure automation, and DevSecOps best practices using Terraform.

Contributions that improve security, reliability, maintainability, or documentation are welcome.

---

## Development Workflow

1. Fork the repository
2. Create a feature branch

```bash
git checkout -b feature/my-feature
```

3. Make your changes

4. Validate Terraform

```bash
terraform fmt -recursive

terraform validate
```

5. Commit changes

```bash
git commit -m "Describe your change"
```

6. Push your branch

```bash
git push origin feature/my-feature
```

7. Open a Pull Request

---

## Coding Standards

### Terraform

- Use reusable modules
- Follow Infrastructure as Code best practices
- Apply consistent formatting
- Use variables instead of hardcoded values
- Add comments where appropriate

### Python

- Follow PEP 8
- Keep functions small and reusable
- Handle exceptions appropriately
- Log meaningful operational information

---

## Security

Never commit:

- AWS Access Keys
- Secret Keys
- Passwords
- Certificates
- Private Keys
- terraform.tfstate
- terraform.tfvars containing sensitive values

Use AWS Secrets Manager whenever possible.

---

## Pull Requests

Please ensure:

- Terraform validates successfully
- Documentation is updated
- README files are updated if necessary
- Code follows project standards

Thank you for helping improve the Healthcare Landing Zone.
