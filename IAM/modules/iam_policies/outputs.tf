output "policies" {
  description = "values of the created IAM policies"
  value = { for name, policy in aws_iam_policy.this : name => {
    id          = policy.id
    arn         = policy.arn
    name        = policy.name
    tags        = policy.tags
  } }
}
