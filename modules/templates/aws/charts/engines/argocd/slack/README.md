# slack

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | ~> 2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labs_repository"></a> [labs\_repository](#module\_labs\_repository) | ../github_repositories | n/a |

## Resources

| Name | Type |
|------|------|
| [kubectl_manifest.application](https://registry.terraform.io/providers/alekc/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.slack-app-secret](https://registry.terraform.io/providers/alekc/kubectl/latest/docs/resources/manifest) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_argocd_slack_app_secret"></a> [argocd\_slack\_app\_secret](#input\_argocd\_slack\_app\_secret) | Name of secret contains Slack app token | `string` | `"argocd-slack-app-secret"` | no |
| <a name="input_awssm_secret_name"></a> [awssm\_secret\_name](#input\_awssm\_secret\_name) | Name of AWSSM secret | `string` | n/a | yes |
| <a name="input_cluster_secret_store_ref_name"></a> [cluster\_secret\_store\_ref\_name](#input\_cluster\_secret\_store\_ref\_name) | ClusterSecretStore name | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_slack_poc_enabled"></a> [slack\_poc\_enabled](#input\_slack\_poc\_enabled) | Whether to test your slack channel with ArgoCD notification | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
