locals {
  fqdn = "${coalesce(var.r53_subzone_name, var.cluster_name)}.${var.r53_hosted_zone_name}"
  # tflint-ignore: terraform_unused_declarations
  private = "private"
  # tflint-ignore: terraform_unused_declarations
  public = "public"
}


locals {
  user_access_entries = { for user in var.developer_users : user => {
    kubernetes_groups = ["${var.kubernetes_groups}-${var.developer_user_group}"]
    principal_arn     = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${user}"
    policy_associations = {
      user = {
        policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"
        access_scope = {
          namespaces = ["kube-system"]
          type       = "namespace"
        }
      }
    }
  } if user == "Terraform" } # This line filters the users

  role_access_entries = { for role in var.developer_roles : role => {
    kubernetes_groups = ["${var.kubernetes_groups}-${var.developer_user_group}"]
    principal_arn     = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${role}"
    policy_associations = {
      role = {
        policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"
        access_scope = {
          namespaces = ["kube-system"]
          type       = "namespace"
        }
      }
    }
  } }
}
