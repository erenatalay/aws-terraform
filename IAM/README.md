# AWS Identity and Access Management (IAM)

## Overview
AWS Identity and Access Management (IAM) is a web service that helps you securely control access to AWS resources. It enables you to manage permissions that control which AWS resources users can access and what actions they can perform on those resources.

## Key Components

### 1. IAM Users
- Individual identities for people or applications that need AWS access
- Each user has unique credentials
- Best practice: Create individual users instead of using root account

### 2. IAM Groups
- Collections of IAM users
- Used to apply permissions to multiple users at once
- Simplifies permission management

### 3. IAM Roles
- Identity with specific permissions that can be assumed by trusted entities
- Used for temporary access or cross-account permissions
- Common uses: EC2 instance profiles, Lambda execution roles, federation

### 4. IAM Policies
- JSON documents that define permissions
- Can be attached to users, groups, or roles
- Types:
  - AWS Managed Policies: Created and managed by AWS
  - Customer Managed Policies: Created and managed by you
  - Inline Policies: Embedded directly in a user, group, or role

## Security Best Practices
1. Enable MFA for privileged users
2. Implement least privilege principle
3. Use roles instead of sharing credentials
4. Regularly audit and rotate credentials
5. Use policy conditions for enhanced security

## Common Use Cases
- Granting users access to specific AWS services
- Providing temporary access for applications
- Cross-account resource access
- Identity federation with corporate directories or web identity providers

## Example IAM Policy
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::example-bucket"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject"
      ],
      "Resource": "arn:aws:s3:::example-bucket/*"
    }
  ]
}
```

## Common Use Cases
- Granting users access to specific AWS services
- Providing temporary access for applications
- Cross-account resource access
- Identity federation with corporate directories or web identity providers

## Example IAM Policies

### Basic S3 Access Policy
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::example-bucket"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject"
      ],
      "Resource": "arn:aws:s3:::example-bucket/*"
    }
  ]
}
```

This example policy allows listing the contents of a specific S3 bucket and reading/writing objects within it.

### EC2 Administrator Policy
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:*"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "elasticloadbalancing:*",
        "cloudwatch:*",
        "autoscaling:*"
      ],
      "Resource": "*"
    }
  ]
}
```

This policy grants full access to EC2 and related services like ELB, CloudWatch, and Auto Scaling.

### Read-Only Access Policy
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:Describe*",
        "rds:Describe*",
        "s3:Get*",
        "s3:List*"
      ],
      "Resource": "*"
    }
  ]
}
```

This policy provides read-only access to EC2, RDS, and S3 services.

### Conditional Access Policy
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": "*",
      "Condition": {
        "IpAddress": {
          "aws:SourceIp": "192.0.2.0/24"
        },
        "Bool": {
          "aws:SecureTransport": "true"
        }
      }
    }
  ]
}
```

This policy allows S3 access only from a specific IP range and only when using HTTPS.

## Terraform IAM Resources
// ...existing code...


This example policy allows listing the contents of a specific S3 bucket and reading/writing objects within it.

## Terraform IAM Resources
- `aws_iam_user`: Manages an IAM user
- `aws_iam_group`: Manages an IAM group
- `aws_iam_role`: Manages an IAM role
- `aws_iam_policy`: Manages an IAM policy
- `aws_iam_policy_attachment`: Attaches a policy to IAM entities

## References
- [AWS IAM Documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html)
- [IAM Best Practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)
- [Terraform IAM Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user)