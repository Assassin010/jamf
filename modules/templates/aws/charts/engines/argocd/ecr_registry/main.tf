resource "kubectl_manifest" "ecr-authorization-token" {
  yaml_body = local.ecr_authorization_token_yaml

  lifecycle {
    precondition {
      condition     = fileexists(local.ecr_authorization_token_yaml_path)
      error_message = " --> Error: Failed to find '${local.ecr_authorization_token_yaml_path}'. Exit terraform process."
    }
  }
}

resource "kubectl_manifest" "ecr-generator" {
  yaml_body = local.ecr_generator_yaml

  lifecycle {
    precondition {
      condition     = fileexists(local.ecr_generator_yaml_path)
      error_message = " --> Error: Failed to find '${local.ecr_generator_yaml_path}'. Exit terraform process."
    }
  }
}

resource "aws_iam_policy" "get-test-oci-helm-charts" {
  policy = data.aws_iam_policy_document.ecr-actions.json
}

module "get-oci-helm-charts" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version                       = "4.2.0"
  create_role                   = true
  role_name                     = var.ecr_role_name
  provider_url                  = var.cluster_oidc_issuer_url
  role_policy_arns              = [aws_iam_policy.get-test-oci-helm-charts.arn]
  oidc_fully_qualified_subjects = ["system:serviceaccount:${var.namespace}:${var.serviceaccount}"]
}
