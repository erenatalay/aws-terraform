output "groups" {
  description = "created IAM groups"
  value = { for name, group in aws_iam_group.this : name => {
    id   = group.id
    arn  = group.arn
    name = group.name
  } }
}