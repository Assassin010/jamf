## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >= 1.7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | >= 1.7.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.argocd](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubectl_manifest.argocd_root_app](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.main_project](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_team_name"></a> [admin\_team\_name](#input\_admin\_team\_name) | Name of admin team | `string` | `"argocd-admins"` | no |
| <a name="input_certificate_issuer_name"></a> [certificate\_issuer\_name](#input\_certificate\_issuer\_name) | Name of cert-manager certificate issuer | `string` | `"letsencrypt-prod"` | no |
| <a name="input_chart_name"></a> [chart\_name](#input\_chart\_name) | Name of the chart to install | `string` | `"argo-cd"` | no |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | Version of the chart to install | `string` | `"5.41.2"` | no |
| <a name="input_configure_initial_gitops_repo"></a> [configure\_initial\_gitops\_repo](#input\_configure\_initial\_gitops\_repo) | Flag if needs to configure initial gitops repo | `bool` | `false` | no |
| <a name="input_configure_sso"></a> [configure\_sso](#input\_configure\_sso) | Flag if needs to configure SSO | `bool` | `false` | no |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | Create the namespace if it does not exist | `bool` | `true` | no |
| <a name="input_create_root_app"></a> [create\_root\_app](#input\_create\_root\_app) | Flag if needs to create root application | `bool` | `false` | no |
| <a name="input_extra_values"></a> [extra\_values](#input\_extra\_values) | Extra values in key value format | `map(any)` | `{}` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | Hostname of argocd | `string` | n/a | yes |
| <a name="input_initial_gitops_repo_password"></a> [initial\_gitops\_repo\_password](#input\_initial\_gitops\_repo\_password) | Password for initial gitops repo | `string` | n/a | yes |
| <a name="input_initial_gitops_repo_url"></a> [initial\_gitops\_repo\_url](#input\_initial\_gitops\_repo\_url) | Initial gitops repo url | `string` | n/a | yes |
| <a name="input_initial_gitops_repo_username"></a> [initial\_gitops\_repo\_username](#input\_initial\_gitops\_repo\_username) | Username for initial gitops repo | `string` | n/a | yes |
| <a name="input_main_project_name"></a> [main\_project\_name](#input\_main\_project\_name) | Name of main project | `string` | `"main"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of release | `string` | `"argocd"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace to install the chart into | `string` | `"argo-cd"` | no |
| <a name="input_oauth_client_secret_name"></a> [oauth\_client\_secret\_name](#input\_oauth\_client\_secret\_name) | Name of AWS secret with OAuth client creds. See README for details | `string` | `""` | no |
| <a name="input_oauth_enabled"></a> [oauth\_enabled](#input\_oauth\_enabled) | Enable OAuth login for ArgoCD | `bool` | `false` | no |
| <a name="input_recreate_pods"></a> [recreate\_pods](#input\_recreate\_pods) | Recreate pods in the deployment if necessary | `bool` | `true` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Repository to install the chart from | `string` | `"https://argoproj.github.io/argo-helm"` | no |
| <a name="input_root_app_destination"></a> [root\_app\_destination](#input\_root\_app\_destination) | Destination of root application | `string` | `"in-cluster"` | no |
| <a name="input_root_app_dir_recurse"></a> [root\_app\_dir\_recurse](#input\_root\_app\_dir\_recurse) | Flag if root application directory needs to be recursed | `bool` | `false` | no |
| <a name="input_root_app_exclude"></a> [root\_app\_exclude](#input\_root\_app\_exclude) | List of root application directories to be excluded | `string` | `""` | no |
| <a name="input_root_app_name"></a> [root\_app\_name](#input\_root\_app\_name) | Name of root application | `string` | `"root_app"` | no |
| <a name="input_root_app_path"></a> [root\_app\_path](#input\_root\_app\_path) | Path of root application | `string` | `"apps"` | no |
| <a name="input_root_app_target_revision"></a> [root\_app\_target\_revision](#input\_root\_app\_target\_revision) | Target revision of root application | `string` | `"HEAD"` | no |
| <a name="input_serviceaccount"></a> [serviceaccount](#input\_serviceaccount) | Serviceaccount name to install the chart into | `string` | `"argocd"` | no |
| <a name="input_sso_client_id"></a> [sso\_client\_id](#input\_sso\_client\_id) | SSO client id | `string` | n/a | yes |
| <a name="input_sso_org"></a> [sso\_org](#input\_sso\_org) | SSO organization | `string` | n/a | yes |
| <a name="input_sso_provider"></a> [sso\_provider](#input\_sso\_provider) | SSO provider. Possible values: google, github, gitlab, dex | `string` | n/a | yes |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | Timeout for the helm release | `number` | `3000` | no |

## Outputs

No outputs.
