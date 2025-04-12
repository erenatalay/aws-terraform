resource "aws_iam_user" "this" {
  for_each = { for user in var.users : user.name => user }

  name                 = each.value.name
  path                 = each.value.path
  permissions_boundary = each.value.permissions_boundary
  force_destroy        = each.value.force_destroy
  tags                 = each.value.tags
}

resource "aws_iam_user_login_profile" "this" {
  for_each = { for user in var.users : user.name => user if user.create_login_profile }

  user                    = aws_iam_user.this[each.key].name
  password_reset_required = each.value.password_reset
  password_length         = lookup(each.value, "password_length", 20)
}

resource "aws_iam_user_group_membership" "this" {
  for_each = { for user in var.users : user.name => user if length(user.group_memberships) > 0 }

  user   = aws_iam_user.this[each.key].name
  groups = each.value.group_memberships
}

resource "aws_iam_user_policy_attachment" "this" {
  for_each = {
    for policy in flatten([
      for user_index, user in var.users : [
        for policy_index, policy_arn in user.policy_attachments : {
          key        = "${user.name}-${policy_index}"
          user       = user.name
          policy_arn = policy_arn
        }
      ]
    ]) : policy.key => policy
  }

  user       = aws_iam_user.this[each.value.user].name
  policy_arn = each.value.policy_arn
}
