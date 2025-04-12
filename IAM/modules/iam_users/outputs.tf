output "users" {
  description = "Details of the created IAM users"
  value = { for name, user in aws_iam_user.this : name => {
    id     = user.id
    arn    = user.arn
    name   = user.name
    unique_id = user.unique_id
  } }
}