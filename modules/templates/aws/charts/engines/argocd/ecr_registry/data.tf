data "aws_iam_policy_document" "ecr-actions" {
  statement {
    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:GetAuthorizationToken",
      "ecr:BatchGetImage",
      "ecr:ListImages",
      "ecr:BatchCheckLayerAvailability"
    ]
    resources = [
      "*",
    ]
  }
}