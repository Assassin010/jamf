# nodes

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.70 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.12.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.27.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.70 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_additional_policy"></a> [additional\_policy](#module\_additional\_policy) | terraform-aws-modules/iam/aws//modules/iam-policy | 5.39.0 |
| <a name="module_eks_managed_node_groups"></a> [eks\_managed\_node\_groups](#module\_eks\_managed\_node\_groups) | terraform-aws-modules/eks/aws//modules/eks-managed-node-group | 20.31.3 |

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_policy.eks_autoscaling_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy) | resource |
| [random_id.additional_id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [aws_iam_policy_document.additional_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_type"></a> [ami\_type](#input\_ami\_type) | The type of AMI to use for the EKS managed node group. | `string` | n/a | yes |
| <a name="input_autoscaling_average_cpu"></a> [autoscaling\_average\_cpu](#input\_autoscaling\_average\_cpu) | Average CPU threshold to autoscale EKS EC2 instances. | `number` | n/a | yes |
| <a name="input_capacity_type"></a> [capacity\_type](#input\_capacity\_type) | Capacity type for the EKS managed node group. | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | EKS cluster name. | `string` | n/a | yes |
| <a name="input_cluster_primary_security_group_id"></a> [cluster\_primary\_security\_group\_id](#input\_cluster\_primary\_security\_group\_id) | Cluster security group that was created by Amazon EKS for the cluster. Managed node groups use this security group for control-plane-to-data-plane communication. Referred to as 'Cluster security group' in the EKS console | `string` | n/a | yes |
| <a name="input_cluster_service_cidr"></a> [cluster\_service\_cidr](#input\_cluster\_service\_cidr) | CIDR block for the EKS cluster service. | `string` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | The Kubernetes server version for the EKS cluster. | `string` | n/a | yes |
| <a name="input_create_managed_node_groups"></a> [create\_managed\_node\_groups](#input\_create\_managed\_node\_groups) | Whether to create a managed node group. | `bool` | n/a | yes |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | Desired number of nodes in the EKS managed node group. | `number` | n/a | yes |
| <a name="input_ebs_kms_key_arn"></a> [ebs\_kms\_key\_arn](#input\_ebs\_kms\_key\_arn) | The ARN of the KMS key to use for EBS encryption. | `string` | n/a | yes |
| <a name="input_eks_managed_node_groups"></a> [eks\_managed\_node\_groups](#input\_eks\_managed\_node\_groups) | values for the EKS managed node groups. | <pre>map(object({<br>    ami_type       = string<br>    min_size       = number<br>    max_size       = number<br>    desired_size   = number<br>    instance_types = list(string)<br>    # tags           = optional(map(string), {}) # Default to an empty map<br>    capacity_type = string<br>    # use_custom_launch_template = bool<br>    # disk_size                  = number<br>    network_interfaces = list(object({<br>      delete_on_termination       = bool<br>      associate_public_ip_address = bool<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_iam_node_group_role"></a> [iam\_node\_group\_role](#input\_iam\_node\_group\_role) | The name of the IAM role to attach to the EKS managed node group. | `string` | n/a | yes |
| <a name="input_iam_role_nodes_additional_policies"></a> [iam\_role\_nodes\_additional\_policies](#input\_iam\_role\_nodes\_additional\_policies) | List of additional IAM policies to attach to EKS managed node groups. | `map(string)` | n/a | yes |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | List of instance types to use for the EKS managed node group. | `list(string)` | n/a | yes |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | Maximum number of nodes in the EKS managed node group. | `number` | n/a | yes |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | Minimum number of nodes in the EKS managed node group. | `number` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the EKS managed node group. | `string` | n/a | yes |
| <a name="input_network_interfaces"></a> [network\_interfaces](#input\_network\_interfaces) | List of network interfaces to attach to the EKS managed node group. | <pre>list(object({<br>    associate_public_ip_address = bool<br>    delete_on_termination       = bool<br>    # description                 = string<br>    # device_index                = number<br>    # security_groups              = list(string)<br>    # subnet_id                   = string<br>  }))</pre> | n/a | yes |
| <a name="input_node_add_policy_name"></a> [node\_add\_policy\_name](#input\_node\_add\_policy\_name) | The name of the additional policy to attach to the EKS managed node group. | `string` | n/a | yes |
| <a name="input_nodegroup_subnet_ids"></a> [nodegroup\_subnet\_ids](#input\_nodegroup\_subnet\_ids) | List of subnet IDs to launch the EKS managed node group in. | `list(string)` | n/a | yes |
| <a name="input_tag_specifications"></a> [tag\_specifications](#input\_tag\_specifications) | List of tag specifications to apply to the EKS managed node group. | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | n/a | yes |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | List of security group IDs to attach to the EKS cluster. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_additional_policy_arn"></a> [additional\_policy\_arn](#output\_additional\_policy\_arn) | n/a |
| <a name="output_node_group_autoscaling_group_names"></a> [node\_group\_autoscaling\_group\_names](#output\_node\_group\_autoscaling\_group\_names) | n/a |
| <a name="output_node_iam_role_arn"></a> [node\_iam\_role\_arn](#output\_node\_iam\_role\_arn) | n/a |
| <a name="output_node_iam_role_name"></a> [node\_iam\_role\_name](#output\_node\_iam\_role\_name) | n/a |
<!-- END_TF_DOCS -->
