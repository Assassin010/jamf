# eks

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.70 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.12.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.27.0 |
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
| <a name="module_cluster"></a> [cluster](#module\_cluster) | terraform-aws-modules/eks/aws | 20.31.3 |
| <a name="module_ebs_kms_key"></a> [ebs\_kms\_key](#module\_ebs\_kms\_key) | ./nodegroup/kms | n/a |
| <a name="module_eks_addons"></a> [eks\_addons](#module\_eks\_addons) | ./addons | n/a |
| <a name="module_fargate"></a> [fargate](#module\_fargate) | ./fargates | n/a |
| <a name="module_nodes"></a> [nodes](#module\_nodes) | ./nodegroup | n/a |
| <a name="module_security_alb_ingress"></a> [security\_alb\_ingress](#module\_security\_alb\_ingress) | ./extra_sg | n/a |
| <a name="module_security_node"></a> [security\_node](#module\_security\_node) | ./extra_sg | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_ec2_tag.cluster_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_tag) | resource |
| [aws_ec2_tag.cluster_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_tag) | resource |
| [aws_ec2_tag.karpenter_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_tag) | resource |
| [aws_ec2_tag.karpenter_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_tag) | resource |
| [aws_iam_policy.role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.role-with-oidc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_route53_record.ns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.cluster_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_eks_cluster_auth.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |
| [aws_iam_policy_document.role_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_route53_zone.parent_hosted_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_addons"></a> [addons](#input\_addons) | List of EKS addons | <pre>list(object({<br>    addon_name               = string<br>    addon_version            = optional(string, "")<br>    service_account_role_arn = optional(string, "")<br>  }))</pre> | n/a | yes |
| <a name="input_autoscaling_average_cpu"></a> [autoscaling\_average\_cpu](#input\_autoscaling\_average\_cpu) | Average CPU threshold to autoscale EKS EC2 instances. | `number` | `0` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the EKS cluster. | `string` | `"value"` | no |
| <a name="input_create_fargate_profile"></a> [create\_fargate\_profile](#input\_create\_fargate\_profile) | Whether to create a Fargate Profile. | `bool` | `false` | no |
| <a name="input_create_managed_node_groups"></a> [create\_managed\_node\_groups](#input\_create\_managed\_node\_groups) | Whether to create a managed node group. | `bool` | `false` | no |
| <a name="input_developer_roles"></a> [developer\_roles](#input\_developer\_roles) | List of Kubernetes developer roles. | `list(string)` | `[]` | no |
| <a name="input_developer_user_group"></a> [developer\_user\_group](#input\_developer\_user\_group) | Name of the kube group for developers. | `string` | `"value"` | no |
| <a name="input_developer_users"></a> [developer\_users](#input\_developer\_users) | List of Kubernetes developers. | `list(string)` | `[]` | no |
| <a name="input_eks_managed_node_groups"></a> [eks\_managed\_node\_groups](#input\_eks\_managed\_node\_groups) | values for the EKS managed node groups. | <pre>map(object({<br>    ami_type       = string<br>    min_size       = number<br>    max_size       = number<br>    desired_size   = number<br>    instance_types = list(string)<br>    capacity_type  = string<br>    # use_custom_launch_template = bool<br>    # disk_size                  = number<br>    network_interfaces = list(object({<br>      delete_on_termination       = bool<br>      associate_public_ip_address = bool<br>    }))<br>  }))</pre> | <pre>{<br>  "name": {<br>    "ami_type": "value",<br>    "capacity_type": "value",<br>    "desired_size": 0,<br>    "instance_types": [<br>      "value"<br>    ],<br>    "max_size": 0,<br>    "min_size": 0,<br>    "network_interfaces": [<br>      {<br>        "associate_public_ip_address": false,<br>        "delete_on_termination": false<br>      }<br>    ]<br>  }<br>}</pre> | no |
| <a name="input_enable_creation_role_with_oidc"></a> [enable\_creation\_role\_with\_oidc](#input\_enable\_creation\_role\_with\_oidc) | Enable creation of IAM roles with OIDC. | `bool` | `false` | no |
| <a name="input_enable_eks_addons"></a> [enable\_eks\_addons](#input\_enable\_eks\_addons) | Flag to enable or disable EKS addons | `bool` | `true` | no |
| <a name="input_fargate_profiles"></a> [fargate\_profiles](#input\_fargate\_profiles) | Map of Fargate profiles to create. | <pre>map(object({<br>    name          = string<br>    namespace     = string<br>    iam_role_name = string<br>    selectors = list(object({<br>      namespace = string<br>      labels    = map(string)<br>    }))<br>    additional_policies = map(string)<br>  }))</pre> | `{}` | no |
| <a name="input_iam_node_group_role"></a> [iam\_node\_group\_role](#input\_iam\_node\_group\_role) | The name of the IAM role to attach to the EKS managed node group. | `string` | `"value"` | no |
| <a name="input_iam_role_nodes_additional_policies"></a> [iam\_role\_nodes\_additional\_policies](#input\_iam\_role\_nodes\_additional\_policies) | List of additional IAM policies to attach to EKS managed node groups. | `map(string)` | `{}` | no |
| <a name="input_kubernetes_groups"></a> [kubernetes\_groups](#input\_kubernetes\_groups) | Name of the Kubernetes group. | `string` | `"value"` | no |
| <a name="input_kubernets_version"></a> [kubernets\_version](#input\_kubernets\_version) | The Kubernetes version for the EKS cluster. | `string` | `""` | no |
| <a name="input_node_add_policy_name"></a> [node\_add\_policy\_name](#input\_node\_add\_policy\_name) | Name of the policy to attach to the EKS managed node group. | `string` | `"value"` | no |
| <a name="input_node_security_group_tags"></a> [node\_security\_group\_tags](#input\_node\_security\_group\_tags) | The tags to apply to the node security group. | `map(string)` | `{}` | no |
| <a name="input_nodegroup_subnet_ids"></a> [nodegroup\_subnet\_ids](#input\_nodegroup\_subnet\_ids) | List of subnet IDs for the EKS Node Group. | `list(string)` | `[]` | no |
| <a name="input_oic_role_configurations"></a> [oic\_role\_configurations](#input\_oic\_role\_configurations) | values for the OIDC role configurations. | <pre>map(object({<br>    role_name           = string<br>    assume_role_actions = list(string)<br>    namespace           = string<br>    service_account     = string<br>    policy_file         = string<br>  }))</pre> | <pre>{<br>  "name": {<br>    "assume_role_actions": [<br>      "value"<br>    ],<br>    "namespace": "value",<br>    "policy_file": "value",<br>    "role_name": "value",<br>    "service_account": "value"<br>  }<br>}</pre> | no |
| <a name="input_private_subnet_ids"></a> [private\_subnet\_ids](#input\_private\_subnet\_ids) | List of subnet IDs for the EKS Node Group. | `list(string)` | `[]` | no |
| <a name="input_public_subnet_ids"></a> [public\_subnet\_ids](#input\_public\_subnet\_ids) | List of subnet IDs for the EKS Node Group. | `list(string)` | `[]` | no |
| <a name="input_r53_hosted_zone_name"></a> [r53\_hosted\_zone\_name](#input\_r53\_hosted\_zone\_name) | Route53 hosted zone name | `string` | `""` | no |
| <a name="input_r53_subzone_name"></a> [r53\_subzone\_name](#input\_r53\_subzone\_name) | Route53 subzone name | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags to apply to the resources | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `string` | `"The ID of the VPC."` | no |
| <a name="input_worker_nodes_kms_key_aliases"></a> [worker\_nodes\_kms\_key\_aliases](#input\_worker\_nodes\_kms\_key\_aliases) | List of aliases for the KMS key | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acm_certificate_arn"></a> [acm\_certificate\_arn](#output\_acm\_certificate\_arn) | The ARN of the certificate |
| <a name="output_cloudwatch_log_group_arn"></a> [cloudwatch\_log\_group\_arn](#output\_cloudwatch\_log\_group\_arn) | CloudWatch log group ARN |
| <a name="output_cloudwatch_log_group_name"></a> [cloudwatch\_log\_group\_name](#output\_cloudwatch\_log\_group\_name) | CloudWatch log group name |
| <a name="output_clsuter_iam_role_name"></a> [clsuter\_iam\_role\_name](#output\_clsuter\_iam\_role\_name) | Cluster IAM role name |
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | ARN of EKS K8S cluster |
| <a name="output_cluster_certificate_authority_data"></a> [cluster\_certificate\_authority\_data](#output\_cluster\_certificate\_authority\_data) | Certificate of EKS K8S cluster (base64) |
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | Endpoint of EKS K8S cluster |
| <a name="output_cluster_iam_role_arn"></a> [cluster\_iam\_role\_arn](#output\_cluster\_iam\_role\_arn) | Cluster IAM role |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | ID of EKS K8S cluster |
| <a name="output_cluster_identity_providers"></a> [cluster\_identity\_providers](#output\_cluster\_identity\_providers) | Cluster identity providers |
| <a name="output_cluster_ip_family"></a> [cluster\_ip\_family](#output\_cluster\_ip\_family) | Cluster IP family |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Name of EKS K8S cluster |
| <a name="output_cluster_oidc_issuer_url"></a> [cluster\_oidc\_issuer\_url](#output\_cluster\_oidc\_issuer\_url) | The URL on the EKS cluster for the OpenID Connect identity provider |
| <a name="output_cluster_oidc_provider"></a> [cluster\_oidc\_provider](#output\_cluster\_oidc\_provider) | OIDC provider |
| <a name="output_cluster_oidc_provider_arn"></a> [cluster\_oidc\_provider\_arn](#output\_cluster\_oidc\_provider\_arn) | The ARN of the OpenID Connect identity provider |
| <a name="output_cluster_platform_version"></a> [cluster\_platform\_version](#output\_cluster\_platform\_version) | Cluster platform version |
| <a name="output_cluster_primary_security_group_id"></a> [cluster\_primary\_security\_group\_id](#output\_cluster\_primary\_security\_group\_id) | Cluster primary security group ID |
| <a name="output_cluster_region"></a> [cluster\_region](#output\_cluster\_region) | Region where the cluster deployed |
| <a name="output_cluster_service_cidr"></a> [cluster\_service\_cidr](#output\_cluster\_service\_cidr) | Cluster service CIDR |
| <a name="output_cluster_status"></a> [cluster\_status](#output\_cluster\_status) | Cluster status |
| <a name="output_cluster_token"></a> [cluster\_token](#output\_cluster\_token) | Authorization token for EKS K8S cluster |
| <a name="output_cluster_version"></a> [cluster\_version](#output\_cluster\_version) | Cluster version |
| <a name="output_combined_primary_and_nodes_security_group_ids"></a> [combined\_primary\_and\_nodes\_security\_group\_ids](#output\_combined\_primary\_and\_nodes\_security\_group\_ids) | Combined security groups |
| <a name="output_node_security_group_arn"></a> [node\_security\_group\_arn](#output\_node\_security\_group\_arn) | Node security group ARN |
| <a name="output_node_security_group_id"></a> [node\_security\_group\_id](#output\_node\_security\_group\_id) | Node security group ID |
| <a name="output_r53_zone_id"></a> [r53\_zone\_id](#output\_r53\_zone\_id) | Cluster route53 zone id |
| <a name="output_r53_zone_name"></a> [r53\_zone\_name](#output\_r53\_zone\_name) | Cluster route53 zone name |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC ID, where the cluster was deployed |
<!-- END_TF_DOCS -->
