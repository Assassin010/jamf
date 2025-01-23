# engines

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.4.1 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | ~> 2.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.27.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_airflow"></a> [airflow](#module\_airflow) | ./apache_airflow | n/a |
| <a name="module_argo_rollouts"></a> [argo\_rollouts](#module\_argo\_rollouts) | ./argo_rollouts | n/a |
| <a name="module_argo_workflows"></a> [argo\_workflows](#module\_argo\_workflows) | ./argo_workflows | n/a |
| <a name="module_argocd"></a> [argocd](#module\_argocd) | ./argocd | n/a |
| <a name="module_jenkins"></a> [jenkins](#module\_jenkins) | ./jenkins_server | n/a |
| <a name="module_kyverno-policy-engine"></a> [kyverno-policy-engine](#module\_kyverno-policy-engine) | ./kyverno_ui | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acm_certificate_arn"></a> [acm\_certificate\_arn](#input\_acm\_certificate\_arn) | n/a | `string` | n/a | yes |
| <a name="input_airflow_enabled"></a> [airflow\_enabled](#input\_airflow\_enabled) | # Apache Airflow | `bool` | `false` | no |
| <a name="input_airflow_namespace"></a> [airflow\_namespace](#input\_airflow\_namespace) | n/a | `string` | `"airflow"` | no |
| <a name="input_airflow_serviceaccount"></a> [airflow\_serviceaccount](#input\_airflow\_serviceaccount) | n/a | `string` | `"airflow"` | no |
| <a name="input_argo_rollouts_customized_demo_enabled"></a> [argo\_rollouts\_customized\_demo\_enabled](#input\_argo\_rollouts\_customized\_demo\_enabled) | Create your own customize rollouts demo | `bool` | `false` | no |
| <a name="input_argo_rollouts_dashboard_enabled"></a> [argo\_rollouts\_dashboard\_enabled](#input\_argo\_rollouts\_dashboard\_enabled) | Enable Argo-Rollouts dashboard ui | `bool` | `true` | no |
| <a name="input_argo_rollouts_enabled"></a> [argo\_rollouts\_enabled](#input\_argo\_rollouts\_enabled) | # Argo Rollouts | `bool` | `false` | no |
| <a name="input_argo_rollouts_extension_enable"></a> [argo\_rollouts\_extension\_enable](#input\_argo\_rollouts\_extension\_enable) | Whether to install Argo-Rollouts extension for ArgoCD | `bool` | `false` | no |
| <a name="input_argo_rollouts_namespace"></a> [argo\_rollouts\_namespace](#input\_argo\_rollouts\_namespace) | n/a | `string` | `"argo-rollouts"` | no |
| <a name="input_argo_rollouts_traffic_light_demo_enabled"></a> [argo\_rollouts\_traffic\_light\_demo\_enabled](#input\_argo\_rollouts\_traffic\_light\_demo\_enabled) | Create traffic\_light rollouts demo | `bool` | `false` | no |
| <a name="input_argo_workflows_enabled"></a> [argo\_workflows\_enabled](#input\_argo\_workflows\_enabled) | # Argo Workflows | `bool` | `false` | no |
| <a name="input_argo_workflows_namespace"></a> [argo\_workflows\_namespace](#input\_argo\_workflows\_namespace) | n/a | `string` | `"argo"` | no |
| <a name="input_argo_workflows_release_name"></a> [argo\_workflows\_release\_name](#input\_argo\_workflows\_release\_name) | Release name of argo-workflows | `string` | `"argo-workflows"` | no |
| <a name="input_argo_workflows_sso_enabled"></a> [argo\_workflows\_sso\_enabled](#input\_argo\_workflows\_sso\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_argocd_enabled"></a> [argocd\_enabled](#input\_argocd\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_argocd_github_sso_secret"></a> [argocd\_github\_sso\_secret](#input\_argocd\_github\_sso\_secret) | Name of secret contains GitHub app credentials | `string` | `"argocd-github-sso"` | no |
| <a name="input_argocd_namespace"></a> [argocd\_namespace](#input\_argocd\_namespace) | Namespace to install the chart into | `string` | `"argocd"` | no |
| <a name="input_argocd_release_name"></a> [argocd\_release\_name](#input\_argocd\_release\_name) | Name of release | `string` | `"argocd"` | no |
| <a name="input_argocd_slack_channel"></a> [argocd\_slack\_channel](#input\_argocd\_slack\_channel) | Name of ArgoCD admins-team on GitHub | `string` | `"argocd-channel"` | no |
| <a name="input_argocd_slack_enabled"></a> [argocd\_slack\_enabled](#input\_argocd\_slack\_enabled) | Whether to connect ArgoCD to Slack channel | `bool` | `false` | no |
| <a name="input_argocd_sso_enabled"></a> [argocd\_sso\_enabled](#input\_argocd\_sso\_enabled) | Whether to use ArgoCD SSO | `bool` | `false` | no |
| <a name="input_awssm_slack_secret_name"></a> [awssm\_slack\_secret\_name](#input\_awssm\_slack\_secret\_name) | Name of AWSSM secret where slack token is stored | `string` | `"argocd-slack-app-token"` | no |
| <a name="input_awssm_sso_secret_name"></a> [awssm\_sso\_secret\_name](#input\_awssm\_sso\_secret\_name) | Name of AWSSM secret where sso secrets are stored | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_cluster_oidc_issuer_url"></a> [cluster\_oidc\_issuer\_url](#input\_cluster\_oidc\_issuer\_url) | cluster\_oidc\_issuer\_url | `string` | n/a | yes |
| <a name="input_cluster_oidc_provider_arn"></a> [cluster\_oidc\_provider\_arn](#input\_cluster\_oidc\_provider\_arn) | n/a | `string` | n/a | yes |
| <a name="input_cluster_secret_store_ref_name"></a> [cluster\_secret\_store\_ref\_name](#input\_cluster\_secret\_store\_ref\_name) | ClusterSecretStore name | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | n/a | `string` | n/a | yes |
| <a name="input_ecr_reg_enabled"></a> [ecr\_reg\_enabled](#input\_ecr\_reg\_enabled) | Whether sync ArgoCD to ECR registry | `bool` | `false` | no |
| <a name="input_github_actions_runner_controller_enabled"></a> [github\_actions\_runner\_controller\_enabled](#input\_github\_actions\_runner\_controller\_enabled) | # GitHub Actions Runners Controller tflint-ignore: terraform\_unused\_declarations | `bool` | `false` | no |
| <a name="input_github_argocd_admins_team"></a> [github\_argocd\_admins\_team](#input\_github\_argocd\_admins\_team) | Name of ArgoCD admins-team on GitHub | `string` | `"argocd-admins"` | no |
| <a name="input_github_org"></a> [github\_org](#input\_github\_org) | GitHub organization name | `string` | `""` | no |
| <a name="input_github_repositories"></a> [github\_repositories](#input\_github\_repositories) | n/a | `list(string)` | `[]` | no |
| <a name="input_github_repositories_enabled"></a> [github\_repositories\_enabled](#input\_github\_repositories\_enabled) | Connect repositories to ArgoCD | `bool` | `false` | no |
| <a name="input_github_runner_reg_url"></a> [github\_runner\_reg\_url](#input\_github\_runner\_reg\_url) | tflint-ignore: terraform\_unused\_declarations | `string` | `""` | no |
| <a name="input_github_runner_serviceaccount"></a> [github\_runner\_serviceaccount](#input\_github\_runner\_serviceaccount) | tflint-ignore: terraform\_unused\_declarations | `string` | `"actions-runner-system"` | no |
| <a name="input_github_runners_deploy_list"></a> [github\_runners\_deploy\_list](#input\_github\_runners\_deploy\_list) | tflint-ignore: terraform\_unused\_declarations | <pre>list(object({<br>    name          = optional(string)<br>    repository    = optional(string)<br>    limits_cpu    = optional(string)<br>    limits_memory = optional(string)<br>    replicas_min  = optional(number)<br>    replicas_max  = optional(number)<br>  }))</pre> | `[]` | no |
| <a name="input_github_runners_extra_values"></a> [github\_runners\_extra\_values](#input\_github\_runners\_extra\_values) | tflint-ignore: terraform\_unused\_declarations | `map(any)` | `{}` | no |
| <a name="input_github_token"></a> [github\_token](#input\_github\_token) | tflint-ignore: terraform\_unused\_declarations | `string` | `""` | no |
| <a name="input_github_token_ssm_parameter"></a> [github\_token\_ssm\_parameter](#input\_github\_token\_ssm\_parameter) | tflint-ignore: terraform\_unused\_declarations | `string` | `""` | no |
| <a name="input_github_webhook_server_enabled"></a> [github\_webhook\_server\_enabled](#input\_github\_webhook\_server\_enabled) | tflint-ignore: terraform\_unused\_declarations | `bool` | `false` | no |
| <a name="input_github_webhook_server_host"></a> [github\_webhook\_server\_host](#input\_github\_webhook\_server\_host) | tflint-ignore: terraform\_unused\_declarations | `string` | `""` | no |
| <a name="input_github_webhook_server_path"></a> [github\_webhook\_server\_path](#input\_github\_webhook\_server\_path) | tflint-ignore: terraform\_unused\_declarations | `string` | `"/"` | no |
| <a name="input_github_webhook_server_secret_enabled"></a> [github\_webhook\_server\_secret\_enabled](#input\_github\_webhook\_server\_secret\_enabled) | tflint-ignore: terraform\_unused\_declarations | `bool` | `false` | no |
| <a name="input_gitops_repo"></a> [gitops\_repo](#input\_gitops\_repo) | GitOps repository name | `string` | `"gitops"` | no |
| <a name="input_gitops_repo_enabled"></a> [gitops\_repo\_enabled](#input\_gitops\_repo\_enabled) | Whether sync ArgoCD to GitOps repository | `bool` | `false` | no |
| <a name="input_jenkins_enabled"></a> [jenkins\_enabled](#input\_jenkins\_enabled) | Jenkins server | `bool` | `false` | no |
| <a name="input_jenkins_namespace"></a> [jenkins\_namespace](#input\_jenkins\_namespace) | n/a | `string` | `"jenkins"` | no |
| <a name="input_jenkins_serviceaccount"></a> [jenkins\_serviceaccount](#input\_jenkins\_serviceaccount) | n/a | `string` | `"jenkins"` | no |
| <a name="input_negative_feedback"></a> [negative\_feedback](#input\_negative\_feedback) | Whether to get negattive notifications from ArgoCD | `bool` | `true` | no |
| <a name="input_policy_reporter_helm_chart_name"></a> [policy\_reporter\_helm\_chart\_name](#input\_policy\_reporter\_helm\_chart\_name) | Name of the chart to install | `string` | n/a | yes |
| <a name="input_policy_reporter_helm_chart_version"></a> [policy\_reporter\_helm\_chart\_version](#input\_policy\_reporter\_helm\_chart\_version) | Version of the chart to install | `string` | n/a | yes |
| <a name="input_policy_reporter_namespace"></a> [policy\_reporter\_namespace](#input\_policy\_reporter\_namespace) | Namespace to install the chart into | `string` | n/a | yes |
| <a name="input_policy_reporter_release_name"></a> [policy\_reporter\_release\_name](#input\_policy\_reporter\_release\_name) | Name of the release | `string` | n/a | yes |
| <a name="input_policy_reporter_settings"></a> [policy\_reporter\_settings](#input\_policy\_reporter\_settings) | Settings for policy reporter | `map(any)` | n/a | yes |
| <a name="input_possitive_feedback"></a> [possitive\_feedback](#input\_possitive\_feedback) | Whether to get possitive notifications from ArgoCD | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | General | `string` | n/a | yes |
| <a name="input_slack_poc_enabled"></a> [slack\_poc\_enabled](#input\_slack\_poc\_enabled) | Whether to test your slack channel with ArgoCD notification | `bool` | `false` | no |
| <a name="input_ui_enabled"></a> [ui\_enabled](#input\_ui\_enabled) | Enable the UI | `bool` | `false` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | tflint-ignore: terraform\_unused\_declarations | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_airflow_url"></a> [airflow\_url](#output\_airflow\_url) | n/a |
| <a name="output_argo_rollouts_demo_url"></a> [argo\_rollouts\_demo\_url](#output\_argo\_rollouts\_demo\_url) | n/a |
| <a name="output_argo_rollouts_url"></a> [argo\_rollouts\_url](#output\_argo\_rollouts\_url) | n/a |
| <a name="output_argo_workflows_url"></a> [argo\_workflows\_url](#output\_argo\_workflows\_url) | n/a |
| <a name="output_argocd_url"></a> [argocd\_url](#output\_argocd\_url) | n/a |
| <a name="output_jenkins_url"></a> [jenkins\_url](#output\_jenkins\_url) | n/a |
<!-- END_TF_DOCS -->
