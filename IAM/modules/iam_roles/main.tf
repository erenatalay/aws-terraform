resource "aws_iam_role" "this" {
  for_each = { for role in var.roles : role.name => role }

  name                 = each.value.name
  path                 = each.value.path
  assume_role_policy   = each.value.assume_role_policy
  description          = each.value.description
  max_session_duration = each.value.max_session_duration
  permissions_boundary = each.value.permissions_boundary
  tags                 = each.value.tags
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = {
    for policy in flatten([
      for role_index, role in var.roles : [
        for policy_index, policy_arn in role.policy_attachments : {
          key        = "${role.name}-${policy_index}"
          role       = role.name
          policy_arn = policy_arn
        }
      ]
    ]) : policy.key => policy
  }

  role       = aws_iam_role.this[each.value.role].name
  policy_arn = each.value.policy_arn
}

resource "aws_iam_role_policy" "this" {
  for_each = {
    for policy in flatten([
      for role_index, role in var.roles : [
        for policy_name, policy_doc in role.inline_policies : {
          key        = "${role.name}-${policy_name}"
          role       = role.name
          name       = policy_name
          policy_doc = policy_doc
        }
      ]
    ]) : policy.key => policy
  }

  name   = each.value.name
  role   = aws_iam_role.this[each.value.role].name
  policy = each.value.policy_doc
}
