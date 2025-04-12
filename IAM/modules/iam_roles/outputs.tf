output "roles" {
  description = "Details of the created IAM roles"
  value = { for name, role in aws_iam_role.this : name => {
    id     = role.id
    arn    = role.arn
    name   = role.name
    unique_id = role.unique_id
  } }
}