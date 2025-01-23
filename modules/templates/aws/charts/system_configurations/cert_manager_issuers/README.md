# cert_manager_issuers

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.70 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.27.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.27.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_manifest.letsencrypt_cluster_issuer_prod](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_manifest.letsencrypt_cluster_issuer_staging](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cert_manager_issuer_production_mode"></a> [cert\_manager\_issuer\_production\_mode](#input\_cert\_manager\_issuer\_production\_mode) | Whether to create a production issuer for cert-manager | `bool` | `false` | no |
| <a name="input_cert_manager_issuer_staging_mode"></a> [cert\_manager\_issuer\_staging\_mode](#input\_cert\_manager\_issuer\_staging\_mode) | Whether to create a staging issuer for cert-manager | `bool` | `false` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the cluster | `string` | n/a | yes |
| <a name="input_ingress_class_name"></a> [ingress\_class\_name](#input\_ingress\_class\_name) | The name of the ingress class to use for the cert-manager issuer | `string` | `"kong"` | no |
| <a name="input_issuer_email"></a> [issuer\_email](#input\_issuer\_email) | The email to use for the cert-manager issuer - Just for getting notification if renewal fails | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate_issuer_name_prod"></a> [certificate\_issuer\_name\_prod](#output\_certificate\_issuer\_name\_prod) | n/a |
| <a name="output_certificate_issuer_name_staging"></a> [certificate\_issuer\_name\_staging](#output\_certificate\_issuer\_name\_staging) | n/a |
<!-- END_TF_DOCS -->
