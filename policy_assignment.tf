locals {
  rw_policies = flatten([
    for user, policy in var.users : [
      for rw_key, _ in policy.rw : {
        user = user
        rw_key = rw_key
      }
    ]
  ])
}

locals {
  ro_policies = flatten([
    for user, policy in var.users : [
      for ro_key, _ in policy.ro : {
        user = user
        ro_key = ro_key
      }
    ]
  ])
}

resource "aws_iam_user_policy_attachment" "user_rw_policies" {
  for_each = {
    for i, p in local.rw_policies : "${p.user}-${p.rw_key}" => p
  }

  user       = aws_iam_user.users[each.value.user].name
  policy_arn = aws_iam_policy.rw_policy[each.value.rw_key].arn

  depends_on = [aws_iam_policy.rw_policy, aws_iam_user.users]
}

resource "aws_iam_user_policy_attachment" "user_ro_policies" {
  for_each = {
    for i, p in local.ro_policies : "${p.user}-${p.ro_key}" => p
  }

  user       = aws_iam_user.users[each.value.user].name
  policy_arn = aws_iam_policy.ro_policy[each.value.ro_key].arn

  depends_on = [aws_iam_policy.ro_policy, aws_iam_user.users]
}