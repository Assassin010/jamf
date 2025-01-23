# cluster

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.70 |
| <a name="requirement_time"></a> [time](#requirement\_time) | >= 0.9.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.70 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_certificate"></a> [certificate](#module\_certificate) | terraform-aws-modules/acm/aws | 4.3.1 |
| <a name="module_cluster"></a> [cluster](#module\_cluster) | terraform-aws-modules/eks/aws | 20.8.5 |

## Resources

| Name | Type |
|------|------|
| [aws_ec2_tag.cluster_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_tag) | resource |
| [aws_ec2_tag.cluster_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_tag) | resource |
| [aws_ec2_tag.karpenter_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_tag) | resource |
| [aws_ec2_tag.karpenter_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_tag) | resource |
| [aws_route53_record.ns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.cluster_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_eks_cluster_auth.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_route53_zone.parent_hosted_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the cluster | `string` | `""` | no |
| <a name="input_developer_roles"></a> [developer\_roles](#input\_developer\_roles) | List of Kubernetes developer roles. | `list(string)` | `[]` | no |
| <a name="input_developer_user_group"></a> [developer\_user\_group](#input\_developer\_user\_group) | Name of the kube group for developers. | `string` | `"value"` | no |
| <a name="input_developer_users"></a> [developer\_users](#input\_developer\_users) | List of Kubernetes developers. | `list(string)` | `[]` | no |
| <a name="input_kubernetes_groups"></a> [kubernetes\_groups](#input\_kubernetes\_groups) | Name of the Kubernetes group. | `string` | `"value"` | no |
| <a name="input_kubernets_version"></a> [kubernets\_version](#input\_kubernets\_version) | The version of Kubernetes | `string` | `""` | no |
| <a name="input_private_subnet_ids"></a> [private\_subnet\_ids](#input\_private\_subnet\_ids) | The private subnet IDs to host the cluster in | `list(string)` | `[]` | no |
| <a name="input_public_subnet_ids"></a> [public\_subnet\_ids](#input\_public\_subnet\_ids) | The public subnet IDs to host the cluster in | `list(string)` | `[]` | no |
| <a name="input_r53_hosted_zone_name"></a> [r53\_hosted\_zone\_name](#input\_r53\_hosted\_zone\_name) | The hosted zone name | `string` | `""` | no |
| <a name="input_r53_subzone_name"></a> [r53\_subzone\_name](#input\_r53\_subzone\_name) | The subzone name | `string` | `""` | no |
| <a name="input_security_alb_ingress_security_group_id"></a> [security\_alb\_ingress\_security\_group\_id](#input\_security\_alb\_ingress\_security\_group\_id) | The security group ID for the ALB ingress controller | `string` | `"value"` | no |
| <a name="input_security_node_security_group_id"></a> [security\_node\_security\_group\_id](#input\_security\_node\_security\_group\_id) | The security group ID for the EKS nodes | `string` | `"value"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags to apply to the resources | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID to host the cluster in | `string` | `"value"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acm_certificate_arn"></a> [acm\_certificate\_arn](#output\_acm\_certificate\_arn) | n/a |
| <a name="output_cloudwatch_log_group_arn"></a> [cloudwatch\_log\_group\_arn](#output\_cloudwatch\_log\_group\_arn) | CloudWatch log group ARN |
| <a name="output_cloudwatch_log_group_name"></a> [cloudwatch\_log\_group\_name](#output\_cloudwatch\_log\_group\_name) | CloudWatch log group name |
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | Cluster ARN |
| <a name="output_cluster_certificate_authority_data"></a> [cluster\_certificate\_authority\_data](#output\_cluster\_certificate\_authority\_data) | Cluster certificate authority data |
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | Cluster endpoint |
| <a name="output_cluster_iam_role_arn"></a> [cluster\_iam\_role\_arn](#output\_cluster\_iam\_role\_arn) | Cluster IAM role |
| <a name="output_cluster_iam_role_name"></a> [cluster\_iam\_role\_name](#output\_cluster\_iam\_role\_name) | Cluster IAM role name |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | Cluster ID |
| <a name="output_cluster_identity_providers"></a> [cluster\_identity\_providers](#output\_cluster\_identity\_providers) | Cluster identity providers |
| <a name="output_cluster_ip_family"></a> [cluster\_ip\_family](#output\_cluster\_ip\_family) | Cluster IP family |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Cluster name |
| <a name="output_cluster_oidc_issuer_url"></a> [cluster\_oidc\_issuer\_url](#output\_cluster\_oidc\_issuer\_url) | Cluster OIDC issuer URL |
| <a name="output_cluster_platform_version"></a> [cluster\_platform\_version](#output\_cluster\_platform\_version) | Cluster platform version |
| <a name="output_cluster_primary_security_group_id"></a> [cluster\_primary\_security\_group\_id](#output\_cluster\_primary\_security\_group\_id) | Cluster primary security group ID |
| <a name="output_cluster_service_cidr"></a> [cluster\_service\_cidr](#output\_cluster\_service\_cidr) | Cluster service CIDR |
| <a name="output_cluster_status"></a> [cluster\_status](#output\_cluster\_status) | Cluster status |
| <a name="output_cluster_version"></a> [cluster\_version](#output\_cluster\_version) | Cluster version |
| <a name="output_eks_token"></a> [eks\_token](#output\_eks\_token) | Authorization token for EKS K8S cluster |
| <a name="output_kms_key_arn"></a> [kms\_key\_arn](#output\_kms\_key\_arn) | KMS key ARN |
| <a name="output_kms_key_id"></a> [kms\_key\_id](#output\_kms\_key\_id) | KMS key ID |
| <a name="output_kms_key_policy"></a> [kms\_key\_policy](#output\_kms\_key\_policy) | KMS key policy |
| <a name="output_node_security_group_arn"></a> [node\_security\_group\_arn](#output\_node\_security\_group\_arn) | Node security group ARN |
| <a name="output_oidc_provider"></a> [oidc\_provider](#output\_oidc\_provider) | OIDC provider |
| <a name="output_oidc_provider_arn"></a> [oidc\_provider\_arn](#output\_oidc\_provider\_arn) | OIDC provider ARN |
| <a name="output_r53_zone_id"></a> [r53\_zone\_id](#output\_r53\_zone\_id) | Cluster route53 zone id |
| <a name="output_r53_zone_name"></a> [r53\_zone\_name](#output\_r53\_zone\_name) | Cluster route53 zone name |
<!-- END_TF_DOCS -->
