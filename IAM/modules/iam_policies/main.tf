resource "aws_iam_policy" "this" {
  for_each = { for policy in var.policies : policy.name => policy }

  name        = each.value.name
  path        = each.value.path
  description = each.value.description
  policy      = each.value.policy
  tags        = each.value.tags
}