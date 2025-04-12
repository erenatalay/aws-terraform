output "iam_users" {
  description = "Details of the created IAM users"
  value       = module.iam_users.users
}

output "iam_groups" {
  description = "Details of the created IAM groups"
  value       = module.iam_groups.groups
}

output "iam_roles" {
  description = "Details of the created IAM roles"
  value       = module.iam_roles.roles
}

output "iam_policies" {
  description = "Details of the created IAM policies"
  value       = module.iam_policies.policies
}