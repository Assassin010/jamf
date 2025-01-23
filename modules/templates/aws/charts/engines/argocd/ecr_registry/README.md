# ecr_registry

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.12.1 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | ~> 2.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.27.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | ~> 2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_get-oci-helm-charts"></a> [get-oci-helm-charts](#module\_get-oci-helm-charts) | terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc | 4.2.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.get-test-oci-helm-charts](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [kubectl_manifest.ecr-authorization-token](https://registry.terraform.io/providers/alekc/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.ecr-generator](https://registry.terraform.io/providers/alekc/kubectl/latest/docs/resources/manifest) | resource |
| [aws_iam_policy_document.ecr-actions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | n/a | `string` | n/a | yes |
| <a name="input_cluster_oidc_issuer_url"></a> [cluster\_oidc\_issuer\_url](#input\_cluster\_oidc\_issuer\_url) | EKS oidc issuer url | `string` | n/a | yes |
| <a name="input_ecr_registry_name"></a> [ecr\_registry\_name](#input\_ecr\_registry\_name) | ECR registry name on ARGOCD | `string` | `"ecr"` | no |
| <a name="input_ecr_role_name"></a> [ecr\_role\_name](#input\_ecr\_role\_name) | ECR registry role name | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | ArgoCD namespace | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_serviceaccount"></a> [serviceaccount](#input\_serviceaccount) | Serviceaccount name to install the chart into | `string` | `"argocd"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecr_url"></a> [ecr\_url](#output\_ecr\_url) | n/a |
<!-- END_TF_DOCS -->
