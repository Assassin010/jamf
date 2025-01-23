# github_repositories

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | ~> 2.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | ~> 5.0 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | ~> 2.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | >= 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_repository.gitops_repo](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository_deploy_key.gitops_repository_deploy_public_key](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_deploy_key) | resource |
| [github_repository_file.applications_directory](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_repository_file.codeowners](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [kubectl_manifest.app_of_apps](https://registry.terraform.io/providers/alekc/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.gitops_repository](https://registry.terraform.io/providers/alekc/kubectl/latest/docs/resources/manifest) | resource |
| [tls_private_key.gitops_repository_generate_keys](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [github_repository.gitops](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/repository) | data source |
| [github_user.current](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/user) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_proj"></a> [app\_proj](#input\_app\_proj) | name of argocd application project | `string` | `"main-proj"` | no |
| <a name="input_apps_of_apps_path"></a> [apps\_of\_apps\_path](#input\_apps\_of\_apps\_path) | Path to all application Yamls in GitOps repository | `string` | `"applications"` | no |
| <a name="input_create_github_repo"></a> [create\_github\_repo](#input\_create\_github\_repo) | Creare a new GitOps repository | `bool` | n/a | yes |
| <a name="input_github_main_branch"></a> [github\_main\_branch](#input\_github\_main\_branch) | GitOps repository main branch | `string` | `"main"` | no |
| <a name="input_github_org"></a> [github\_org](#input\_github\_org) | GitOps repository organization | `string` | `""` | no |
| <a name="input_github_repo"></a> [github\_repo](#input\_github\_repo) | Github repository name | `string` | n/a | yes |
| <a name="input_github_ssh_public_key_name"></a> [github\_ssh\_public\_key\_name](#input\_github\_ssh\_public\_key\_name) | Deploy key name on GitHub, where the public key is stored | `string` | `"argocd"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | ArgoCD namespace | `string` | `"argocd"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ssh_clone_url"></a> [ssh\_clone\_url](#output\_ssh\_clone\_url) | n/a |
<!-- END_TF_DOCS -->
