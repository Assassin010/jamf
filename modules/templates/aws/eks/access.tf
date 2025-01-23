locals {
  role_enabled = var.enable_creation_role_with_oidc ? var.oic_role_configurations : {}
}

resource "aws_iam_role" "role-with-oidc" {
  for_each           = local.role_enabled
  name               = each.value.role_name
  assume_role_policy = data.aws_iam_policy_document.role_assume_role_policy[each.key].json
  tags = merge(
    {
      Name = "${var.cluster_name}-${each.value.role_name}"
    },
    var.tags
  )
}

data "aws_iam_policy_document" "role_assume_role_policy" {
  for_each = local.role_enabled

  statement {
    sid     = "AllowAssumeRole"
    effect  = "Allow"
    actions = each.value.assume_role_actions

    condition {
      test     = "StringEquals"
      variable = "${module.cluster.oidc_provider}:sub"
      values   = ["system:serviceaccount:${each.value.namespace}:${each.value.service_account}"]
    }

    condition {
      test     = "StringEquals"
      variable = "${module.cluster.oidc_provider}:aud"
      values   = ["sts.amazonaws.com"]
    }

    principals {
      type        = "Federated"
      identifiers = [module.cluster.oidc_provider_arn]
    }
  }
}

resource "aws_iam_policy" "role_policy" {
  for_each = local.role_enabled

  name        = "${each.value.role_name}-policy"
  description = "Policy for ${each.value.role_name}"
  policy      = file("${path.module}/policies/${each.value.policy_file}")
}

resource "aws_iam_role_policy_attachment" "role_policy_attachment" {
  for_each = local.role_enabled

  role       = aws_iam_role.role-with-oidc[each.key].name
  policy_arn = aws_iam_policy.role_policy[each.key].arn
}
