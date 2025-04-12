aws_region = "us-east-1"

groups = [
  {
    name               = "Administrators"
    policy_attachments = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  },
  {
    name               = "Developers"
    policy_attachments = ["arn:aws:iam::aws:policy/PowerUserAccess"]
  },
  {
    name               = "JuniorDevelopers"
    policy_attachments = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  }
]
# policies = [
#   {
#     name        = "CustomS3BucketAccess"
#     description = "Access permissions for specific S3 buckets"
#     policy      = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Action": [
#         "s3:GetObject",
#         "s3:ListBucket"
#       ],
#       "Resource": [
#         "arn:aws:s3:::company-bucket",
#         "arn:aws:s3:::company-bucket/*"
#       ]
#     }
#   ]
# }
# EOF
#   }
# ]

# IAM Roles
# roles = [
#   {
#     name               = "EC2ServiceRole"
#     description        = "Role for EC2 service to use"
#     assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       },
#       "Action": "sts:AssumeRole"
#     }
#   ]
# }
# EOF
#     policy_attachments = ["arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess", "CustomS3BucketAccess"]
#     inline_policies    = {
#       "EC2AdditionalPermissions" = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Action": [
#         "ec2:DescribeInstances",
#         "ec2:DescribeTags"
#       ],
#       "Resource": "*"
#     }
#   ]
# }
# EOF
#     }
#   }
# ]

# IAM Users
users = [
  {
    name                = "admin-user"
    create_login_profile = true
    password_reset      = true
    group_memberships   = ["Administrators"]
  }
]