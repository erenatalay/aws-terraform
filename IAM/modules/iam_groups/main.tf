resource "aws_iam_group" "this" {
 for_each = {for group in var.groups : group.name => group}
 name        = each.value.name
 path        = each.value.path
}

resource "aws_iam_group_policy_attachment" "this" {
  for_each = {
    for policy in flatten([
      for group_index, group in var.groups : [
        for policy_index, policy_arn in group.policy_attachments : {
          key        = "${group.name}-${policy_index}"
          group      = group.name
          policy_arn = policy_arn
        }
      ]
    ]) : policy.key => policy
  }

  group      = aws_iam_group.this[each.value.group].name
  policy_arn = each.value.policy_arn
}