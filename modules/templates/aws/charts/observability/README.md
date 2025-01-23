# observability

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.12.1 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | ~> 2.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_jaeger"></a> [jaeger](#module\_jaeger) | ./jaeger_service | n/a |
| <a name="module_kubeshark"></a> [kubeshark](#module\_kubeshark) | ./kubeshark_service | n/a |
| <a name="module_loki-stack"></a> [loki-stack](#module\_loki-stack) | ./loki_stack | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acm_certificate_arn"></a> [acm\_certificate\_arn](#input\_acm\_certificate\_arn) | n/a | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_cluster_oidc_provider_arn"></a> [cluster\_oidc\_provider\_arn](#input\_cluster\_oidc\_provider\_arn) | tflint-ignore: terraform\_unused\_declarations | `string` | n/a | yes |
| <a name="input_cluster_region"></a> [cluster\_region](#input\_cluster\_region) | # Common variables | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | n/a | `string` | n/a | yes |
| <a name="input_jaeger_demo_app_enabled"></a> [jaeger\_demo\_app\_enabled](#input\_jaeger\_demo\_app\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_jaeger_enabled"></a> [jaeger\_enabled](#input\_jaeger\_enabled) | Jaeger vars | `bool` | `false` | no |
| <a name="input_jaeger_name"></a> [jaeger\_name](#input\_jaeger\_name) | n/a | `string` | `"jaeger"` | no |
| <a name="input_jaeger_namespace"></a> [jaeger\_namespace](#input\_jaeger\_namespace) | n/a | `string` | `"jaeger"` | no |
| <a name="input_jaeger_scheme"></a> [jaeger\_scheme](#input\_jaeger\_scheme) | n/a | `string` | `"internet-facing"` | no |
| <a name="input_kubeshark_enabled"></a> [kubeshark\_enabled](#input\_kubeshark\_enabled) | Kubeshark vars | `bool` | `false` | no |
| <a name="input_kubeshark_name"></a> [kubeshark\_name](#input\_kubeshark\_name) | n/a | `string` | `"kubeshark"` | no |
| <a name="input_kubeshark_namespace"></a> [kubeshark\_namespace](#input\_kubeshark\_namespace) | n/a | `string` | `"kube-system"` | no |
| <a name="input_kubeshark_scheme"></a> [kubeshark\_scheme](#input\_kubeshark\_scheme) | n/a | `string` | `"internet-facing"` | no |
| <a name="input_loki_stack_enabled"></a> [loki\_stack\_enabled](#input\_loki\_stack\_enabled) | loki\_stack | `bool` | `false` | no |
| <a name="input_loki_stack_github_oauth_allowed_domains"></a> [loki\_stack\_github\_oauth\_allowed\_domains](#input\_loki\_stack\_github\_oauth\_allowed\_domains) | List of allowed domains for Github OAuth | `list(string)` | `[]` | no |
| <a name="input_loki_stack_github_oauth_allowed_organizations"></a> [loki\_stack\_github\_oauth\_allowed\_organizations](#input\_loki\_stack\_github\_oauth\_allowed\_organizations) | List of allowed organizations for Github OAuth | `list(string)` | `[]` | no |
| <a name="input_loki_stack_github_oauth_allowed_team_ids"></a> [loki\_stack\_github\_oauth\_allowed\_team\_ids](#input\_loki\_stack\_github\_oauth\_allowed\_team\_ids) | List of allowed teams for Github OAuth | `list(string)` | `[]` | no |
| <a name="input_loki_stack_github_oauth_client_id"></a> [loki\_stack\_github\_oauth\_client\_id](#input\_loki\_stack\_github\_oauth\_client\_id) | Github OAuth Client Id | `string` | `""` | no |
| <a name="input_loki_stack_github_oauth_client_secret"></a> [loki\_stack\_github\_oauth\_client\_secret](#input\_loki\_stack\_github\_oauth\_client\_secret) | Github OAuth Client Secret | `string` | `""` | no |
| <a name="input_loki_stack_github_oauth_enabled"></a> [loki\_stack\_github\_oauth\_enabled](#input\_loki\_stack\_github\_oauth\_enabled) | Enable or not Github OAuth | `bool` | `false` | no |
| <a name="input_loki_stack_ingress_enabled"></a> [loki\_stack\_ingress\_enabled](#input\_loki\_stack\_ingress\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_loki_stack_loki_volume_size"></a> [loki\_stack\_loki\_volume\_size](#input\_loki\_stack\_loki\_volume\_size) | n/a | `string` | `"20Gi"` | no |
| <a name="input_loki_stack_namespace"></a> [loki\_stack\_namespace](#input\_loki\_stack\_namespace) | n/a | `string` | `"loki_stack"` | no |
| <a name="input_loki_stack_prometheus_alert_manager_volume_size"></a> [loki\_stack\_prometheus\_alert\_manager\_volume\_size](#input\_loki\_stack\_prometheus\_alert\_manager\_volume\_size) | n/a | `string` | `"5Gi"` | no |
| <a name="input_loki_stack_prometheus_server_volume_size"></a> [loki\_stack\_prometheus\_server\_volume\_size](#input\_loki\_stack\_prometheus\_server\_volume\_size) | n/a | `string` | `"20Gi"` | no |
| <a name="input_loki_stack_serviceaccount"></a> [loki\_stack\_serviceaccount](#input\_loki\_stack\_serviceaccount) | n/a | `string` | `"loki_stack"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | tflint-ignore: terraform\_unused\_declarations | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_grafana_url"></a> [grafana\_url](#output\_grafana\_url) | n/a |
| <a name="output_jaeger_url"></a> [jaeger\_url](#output\_jaeger\_url) | n/a |
| <a name="output_kubeshark_url"></a> [kubeshark\_url](#output\_kubeshark\_url) | n/a |
<!-- END_TF_DOCS -->
