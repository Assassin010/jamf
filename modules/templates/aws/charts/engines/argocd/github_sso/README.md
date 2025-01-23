# github_sso

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

No modules.

## Resources

| Name | Type |
|------|------|
| [kubectl_manifest.github-app-secrets](https://registry.terraform.io/providers/alekc/kubectl/latest/docs/resources/manifest) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_argocd_github_sso_secret"></a> [argocd\_github\_sso\_secret](#input\_argocd\_github\_sso\_secret) | Name of secret contains GitHub app credentials | `string` | n/a | yes |
| <a name="input_awssm_secret_name"></a> [awssm\_secret\_name](#input\_awssm\_secret\_name) | Name of AWSSM secret | `string` | n/a | yes |
| <a name="input_cluster_secret_store_ref_name"></a> [cluster\_secret\_store\_ref\_name](#input\_cluster\_secret\_store\_ref\_name) | ClusterSecretStore name | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
