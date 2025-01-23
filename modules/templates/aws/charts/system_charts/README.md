# system_charts

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.4.1 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | ~> 2.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb-controller"></a> [alb-controller](#module\_alb-controller) | ./alb_controller | n/a |
| <a name="module_aws_node_termination_handler"></a> [aws\_node\_termination\_handler](#module\_aws\_node\_termination\_handler) | ./aws_node_termination_handler | n/a |
| <a name="module_cert-manager"></a> [cert-manager](#module\_cert-manager) | ./certificate_manager | n/a |
| <a name="module_cluster-autoscaler"></a> [cluster-autoscaler](#module\_cluster-autoscaler) | ./cluster_autoscaler | n/a |
| <a name="module_ebs_csi_driver"></a> [ebs\_csi\_driver](#module\_ebs\_csi\_driver) | ./ebs_csi | n/a |
| <a name="module_eks_blueprints_addons"></a> [eks\_blueprints\_addons](#module\_eks\_blueprints\_addons) | ./custom_helm_addons | n/a |
| <a name="module_eks_external-dns"></a> [eks\_external-dns](#module\_eks\_external-dns) | ./eks_external_dns | n/a |
| <a name="module_external_secrets"></a> [external\_secrets](#module\_external\_secrets) | ./external_secrets | n/a |
| <a name="module_karpenter"></a> [karpenter](#module\_karpenter) | ./karpenter | n/a |
| <a name="module_keda"></a> [keda](#module\_keda) | ./keda_operator | n/a |
| <a name="module_kong"></a> [kong](#module\_kong) | ./kong_ingress_controller | n/a |
| <a name="module_metrics_server"></a> [metrics\_server](#module\_metrics\_server) | ./metrics_server | n/a |
| <a name="module_nvidia_device_plugin"></a> [nvidia\_device\_plugin](#module\_nvidia\_device\_plugin) | ./nvidia_device_plugin | n/a |
| <a name="module_yunikorn"></a> [yunikorn](#module\_yunikorn) | ./yunikorn | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acm_certificate_arn"></a> [acm\_certificate\_arn](#input\_acm\_certificate\_arn) | tflint-ignore: terraform\_unused\_declarations | `string` | n/a | yes |
| <a name="input_alb_controller_enabled"></a> [alb\_controller\_enabled](#input\_alb\_controller\_enabled) | AWS LB Controller | `bool` | `false` | no |
| <a name="input_alb_controller_namespace"></a> [alb\_controller\_namespace](#input\_alb\_controller\_namespace) | n/a | `string` | `"kube-system"` | no |
| <a name="input_aws_node_termination_handler_enabled"></a> [aws\_node\_termination\_handler\_enabled](#input\_aws\_node\_termination\_handler\_enabled) | AWS node termination handler | `bool` | `false` | no |
| <a name="input_aws_node_termination_handler_namespace"></a> [aws\_node\_termination\_handler\_namespace](#input\_aws\_node\_termination\_handler\_namespace) | n/a | `string` | `"kube-system"` | no |
| <a name="input_cert_manager_enabled"></a> [cert\_manager\_enabled](#input\_cert\_manager\_enabled) | Whether to install cert-manager | `bool` | `false` | no |
| <a name="input_cert_manager_namespace"></a> [cert\_manager\_namespace](#input\_cert\_manager\_namespace) | The namespace to install cert-manager | `string` | `"cert-manager"` | no |
| <a name="input_cluster_autoscaler_enabled"></a> [cluster\_autoscaler\_enabled](#input\_cluster\_autoscaler\_enabled) | Cluster autoscaler | `bool` | `false` | no |
| <a name="input_cluster_autoscaler_namespace"></a> [cluster\_autoscaler\_namespace](#input\_cluster\_autoscaler\_namespace) | n/a | `string` | `"kube-system"` | no |
| <a name="input_cluster_endpoint"></a> [cluster\_endpoint](#input\_cluster\_endpoint) | EKS cluster endpoint | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the cluster | `string` | n/a | yes |
| <a name="input_cluster_oidc_provider_arn"></a> [cluster\_oidc\_provider\_arn](#input\_cluster\_oidc\_provider\_arn) | The OIDC provider ARN for the EKS cluster | `string` | `"arn:aws:iam::account-id:oidc-provider/oidc.eks.region.amazonaws.com/id"` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | The Kubernetes version to use for the EKS cluster | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain filter to install external-dns | `string` | n/a | yes |
| <a name="input_ebs_csi_driver_namespace"></a> [ebs\_csi\_driver\_namespace](#input\_ebs\_csi\_driver\_namespace) | Namespace name to deploy helm release | `string` | `"kube-system"` | no |
| <a name="input_ebs_csi_enabled"></a> [ebs\_csi\_enabled](#input\_ebs\_csi\_enabled) | EBS CSI Driver | `bool` | `false` | no |
| <a name="input_eks_external_dns_enabled"></a> [eks\_external\_dns\_enabled](#input\_eks\_external\_dns\_enabled) | Whether to install external-dns for eks | `bool` | `false` | no |
| <a name="input_enabled_custom_helm"></a> [enabled\_custom\_helm](#input\_enabled\_custom\_helm) | Flag to enable or disable the creation of custom Helm addons and associated resources | `bool` | `false` | no |
| <a name="input_external_dns_namespace"></a> [external\_dns\_namespace](#input\_external\_dns\_namespace) | The namespace to install external-dns | `string` | `"external-dns"` | no |
| <a name="input_external_secrets_enabled"></a> [external\_secrets\_enabled](#input\_external\_secrets\_enabled) | External Secrets | `bool` | `false` | no |
| <a name="input_external_secrets_namespace"></a> [external\_secrets\_namespace](#input\_external\_secrets\_namespace) | Namespace name to deploy helm release | `string` | `"kube-system"` | no |
| <a name="input_external_secrets_regex"></a> [external\_secrets\_regex](#input\_external\_secrets\_regex) | AWS SM Secrets regex for ARN | `string` | `"*"` | no |
| <a name="input_karpenter_enabled"></a> [karpenter\_enabled](#input\_karpenter\_enabled) | Whether to install karpenter | `bool` | `false` | no |
| <a name="input_karpenter_namespace"></a> [karpenter\_namespace](#input\_karpenter\_namespace) | n/a | `string` | `"kube-system"` | no |
| <a name="input_keda_enabled"></a> [keda\_enabled](#input\_keda\_enabled) | Keda | `bool` | `false` | no |
| <a name="input_keda_namespace"></a> [keda\_namespace](#input\_keda\_namespace) | Namespace name to deploy helm release | `string` | `"keda"` | no |
| <a name="input_keda_poc_enabled"></a> [keda\_poc\_enabled](#input\_keda\_poc\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_kong_enabled"></a> [kong\_enabled](#input\_kong\_enabled) | Whether to install kong | `bool` | `false` | no |
| <a name="input_kong_namespace"></a> [kong\_namespace](#input\_kong\_namespace) | The namespace to install kong | `string` | `"kong"` | no |
| <a name="input_metrics_server_enabled"></a> [metrics\_server\_enabled](#input\_metrics\_server\_enabled) | Metrics Server | `bool` | `false` | no |
| <a name="input_metrics_server_namespace"></a> [metrics\_server\_namespace](#input\_metrics\_server\_namespace) | Namespace name to deploy helm release | `string` | `"kube-system"` | no |
| <a name="input_nvdp_chart_name"></a> [nvdp\_chart\_name](#input\_nvdp\_chart\_name) | Name of chart for nvidia-device-plugin | `string` | n/a | yes |
| <a name="input_nvdp_chart_version"></a> [nvdp\_chart\_version](#input\_nvdp\_chart\_version) | Version of the chart for nvidia-device-plugin | `string` | n/a | yes |
| <a name="input_nvdp_release_name"></a> [nvdp\_release\_name](#input\_nvdp\_release\_name) | Name of release for nvidia-device-plugin | `string` | n/a | yes |
| <a name="input_nvidia_device_plugin_enabled"></a> [nvidia\_device\_plugin\_enabled](#input\_nvidia\_device\_plugin\_enabled) | NVIDIA Device Plugin | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | The region to host the cluster in | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be attached to resources | `map(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID to host the cluster in | `string` | n/a | yes |
| <a name="input_yunikorn_chart_name"></a> [yunikorn\_chart\_name](#input\_yunikorn\_chart\_name) | Name of chart for yunikorn | `string` | n/a | yes |
| <a name="input_yunikorn_chart_version"></a> [yunikorn\_chart\_version](#input\_yunikorn\_chart\_version) | Version of the chart for yunikorn | `string` | n/a | yes |
| <a name="input_yunikorn_enabled"></a> [yunikorn\_enabled](#input\_yunikorn\_enabled) | Yunikorn | `bool` | `false` | no |
| <a name="input_yunikorn_release_name"></a> [yunikorn\_release\_name](#input\_yunikorn\_release\_name) | Name of release for yunikorn | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_secret_store_ref_name"></a> [cluster\_secret\_store\_ref\_name](#output\_cluster\_secret\_store\_ref\_name) | n/a |
<!-- END_TF_DOCS -->
