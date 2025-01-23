# ArgoCD Module

### TL;DR

This module aims to set up and configure ArgoCD with the following prepared:

1. Redis HA
2. SSO Configured - Currently Supported - GitHub
3. Configure RBAC
   1. Associate **_"argocd-admins"_** group with admin policies
   2. Default read-only permissions to users who are not in the Argocd-admin group
4. Create **_"main"_** project - DO not use the "default" project
5. Configure GitOps Repository - This is the main repository where all the applications, ApplicationSets, App of apps,etc should be. For How to best design and implement your GitOps - [Our GitOps Repo](https://github.com/Opsfleet/gitops)

<br>

## Configure GitOps Repo Credentials

It is recommended to have a dedicated GitOps repo that is separated from the application code. You can take [our GitOps Repo] as an example(https://github.com/Opsfleet/gitops)

The Gitops repo credentials are taken from environment variables. If The Flag _**"argocd_configure_initial_gitops_repo"**_ is enabled, you need to make sure to create the following environment vars:

- repo_username - The username of your repository manager
- repo_password - The password of your repository manager

#### You can use the following snippet:

```bash
repo_username=<your-username>
repo_password=<your_password>
```

<br><br>

## SSO Configuration

### Currently Supporting:

1. GitHub connector

### Secret Creation

You need to create the following secret for the auth to work. In this secret, you store your secret token for the SSO auth.

```bash
kubectl apply -f - <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: github-creds
  namespace: argocd
  labels:
    app.kubernetes.io/part-of: argocd
type: Opaque
data:
  dex.github.clientSecret: <Secret-Base64-Encoded>
EOF
```

### RBAC Configuration

```
    # Policy rules are in the form:
    #  p, subject, resource, action, object, effect
    # Role definitions and bindings are in the form:
    #  g, subject, inherited-subject
```

<br><br><br>

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 0.13  |
| <a name="requirement_kubectl"></a> [kubectl](#requirement_kubectl)       | >= 2.0.2 |

## Providers

| Name                                                         | Version  |
| ------------------------------------------------------------ | -------- |
| <a name="provider_helm"></a> [helm](#provider_helm)          | n/a      |
| <a name="provider_kubectl"></a> [kubectl](#provider_kubectl) | >= 2.0.2 |

## Modules

No modules.

## Resources

| Name                                                                                                                           | Type     |
| ------------------------------------------------------------------------------------------------------------------------------ | -------- |
| [helm_release.argocd](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release)                    | resource |
| [kubectl_manifest.argocd_root_app](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.main_project](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest)    | resource |

## Inputs

| Name                                                                                                                     | Description                                                        | Type       | Default                                  | Required |
| ------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------ | ---------- | ---------------------------------------- | :------: |
| <a name="input_admin_team_name"></a> [admin_team_name](#input_admin_team_name)                                           | Name of admin team                                                 | `string`   | `"argocd-admins"`                        |    no    |
| <a name="input_certificate_issuer_name"></a> [certificate_issuer_name](#input_certificate_issuer_name)                   | Name of cert-manager certificate issuer                            | `string`   | `"letsencrypt-prod"`                     |    no    |
| <a name="input_chart_name"></a> [chart_name](#input_chart_name)                                                          | Name of the chart to install                                       | `string`   | `"argo-cd"`                              |    no    |
| <a name="input_chart_version"></a> [chart_version](#input_chart_version)                                                 | Version of the chart to install                                    | `string`   | `"5.41.2"`                               |    no    |
| <a name="input_configure_initial_gitops_repo"></a> [configure_initial_gitops_repo](#input_configure_initial_gitops_repo) | Flag if needs to configure initial gitops repo                     | `bool`     | `false`                                  |    no    |
| <a name="input_configure_sso"></a> [configure_sso](#input_configure_sso)                                                 | Flag if needs to configure SSO                                     | `bool`     | `false`                                  |    no    |
| <a name="input_create_namespace"></a> [create_namespace](#input_create_namespace)                                        | Create the namespace if it does not exist                          | `bool`     | `true`                                   |    no    |
| <a name="input_create_root_app"></a> [create_root_app](#input_create_root_app)                                           | Flag if needs to create root application                           | `bool`     | `false`                                  |    no    |
| <a name="input_extra_values"></a> [extra_values](#input_extra_values)                                                    | Extra values in key value format                                   | `map(any)` | `{}`                                     |    no    |
| <a name="input_hostname"></a> [hostname](#input_hostname)                                                                | Hostname of argocd                                                 | `string`   | n/a                                      |   yes    |
| <a name="input_initial_gitops_repo_password"></a> [initial_gitops_repo_password](#input_initial_gitops_repo_password)    | Password for initial gitops repo                                   | `string`   | n/a                                      |   yes    |
| <a name="input_initial_gitops_repo_url"></a> [initial_gitops_repo_url](#input_initial_gitops_repo_url)                   | Initial gitops repo url                                            | `string`   | n/a                                      |   yes    |
| <a name="input_initial_gitops_repo_username"></a> [initial_gitops_repo_username](#input_initial_gitops_repo_username)    | Username for initial gitops repo                                   | `string`   | n/a                                      |   yes    |
| <a name="input_main_project_name"></a> [main_project_name](#input_main_project_name)                                     | Name of main project                                               | `string`   | `"main"`                                 |    no    |
| <a name="input_name"></a> [name](#input_name)                                                                            | Name of release                                                    | `string`   | `"argocd"`                               |    no    |
| <a name="input_namespace"></a> [namespace](#input_namespace)                                                             | Namespace to install the chart into                                | `string`   | `"argo-cd"`                              |    no    |
| <a name="input_oauth_client_secret_name"></a> [oauth_client_secret_name](#input_oauth_client_secret_name)                | Name of AWS secret with OAuth client creds. See README for details | `string`   | `""`                                     |    no    |
| <a name="input_oauth_enabled"></a> [oauth_enabled](#input_oauth_enabled)                                                 | Enable OAuth login for ArgoCD                                      | `bool`     | `false`                                  |    no    |
| <a name="input_recreate_pods"></a> [recreate_pods](#input_recreate_pods)                                                 | Recreate pods in the deployment if necessary                       | `bool`     | `true`                                   |    no    |
| <a name="input_repository"></a> [repository](#input_repository)                                                          | Repository to install the chart from                               | `string`   | `"https://argoproj.github.io/argo-helm"` |    no    |
| <a name="input_root_app_destination"></a> [root_app_destination](#input_root_app_destination)                            | Destination of root application                                    | `string`   | `"in-cluster"`                           |    no    |
| <a name="input_root_app_dir_recurse"></a> [root_app_dir_recurse](#input_root_app_dir_recurse)                            | Flag if root application directory needs to be recursed            | `bool`     | `false`                                  |    no    |
| <a name="input_root_app_exclude"></a> [root_app_exclude](#input_root_app_exclude)                                        | List of root application directories to be excluded                | `string`   | `""`                                     |    no    |
| <a name="input_root_app_name"></a> [root_app_name](#input_root_app_name)                                                 | Name of root application                                           | `string`   | `"root_app"`                             |    no    |
| <a name="input_root_app_path"></a> [root_app_path](#input_root_app_path)                                                 | Path of root application                                           | `string`   | `"apps"`                                 |    no    |
| <a name="input_root_app_target_revision"></a> [root_app_target_revision](#input_root_app_target_revision)                | Target revision of root application                                | `string`   | `"HEAD"`                                 |    no    |
| <a name="input_serviceaccount"></a> [serviceaccount](#input_serviceaccount)                                              | Serviceaccount name to install the chart into                      | `string`   | `"argocd"`                               |    no    |
| <a name="input_sso_client_id"></a> [sso_client_id](#input_sso_client_id)                                                 | SSO client id                                                      | `string`   | n/a                                      |   yes    |
| <a name="input_sso_org"></a> [sso_org](#input_sso_org)                                                                   | SSO organization                                                   | `string`   | n/a                                      |   yes    |
| <a name="input_sso_provider"></a> [sso_provider](#input_sso_provider)                                                    | SSO provider. Possible values: google, github, gitlab, dex         | `string`   | n/a                                      |   yes    |
| <a name="input_timeout"></a> [timeout](#input_timeout)                                                                   | Timeout for the helm release                                       | `number`   | `3000`                                   |    no    |

## Outputs

No outputs.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.12.1 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | ~> 2.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.27.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | ~> 2.12.1 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | ~> 2.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.27.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecr_registry"></a> [ecr\_registry](#module\_ecr\_registry) | ./ecr_registry | n/a |
| <a name="module_github_repositories"></a> [github\_repositories](#module\_github\_repositories) | ./github_repositories | n/a |
| <a name="module_github_sso_argo_workflows"></a> [github\_sso\_argo\_workflows](#module\_github\_sso\_argo\_workflows) | ./github_sso | n/a |
| <a name="module_github_sso_argocd"></a> [github\_sso\_argocd](#module\_github\_sso\_argocd) | ./github_sso | n/a |
| <a name="module_gitops_repository"></a> [gitops\_repository](#module\_gitops\_repository) | ./github_repositories | n/a |
| <a name="module_slack"></a> [slack](#module\_slack) | ./slack | n/a |

## Resources

| Name | Type |
|------|------|
| [helm_release.argocd](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubectl_manifest.main_project](https://registry.terraform.io/providers/alekc/kubectl/latest/docs/resources/manifest) | resource |
| [kubernetes_namespace.argo-workflows-namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_argo_rollouts_extension_enable"></a> [argo\_rollouts\_extension\_enable](#input\_argo\_rollouts\_extension\_enable) | Whether to install Argo-Rollouts extension for ArgoCD | `bool` | `false` | no |
| <a name="input_argo_workflows_hostname"></a> [argo\_workflows\_hostname](#input\_argo\_workflows\_hostname) | Argo-Workflows hostname | `string` | n/a | yes |
| <a name="input_argo_workflows_namespace"></a> [argo\_workflows\_namespace](#input\_argo\_workflows\_namespace) | Argo-Workflows namespace | `string` | n/a | yes |
| <a name="input_argo_workflows_sso_enabled"></a> [argo\_workflows\_sso\_enabled](#input\_argo\_workflows\_sso\_enabled) | Whether to add argo-workflows to argocd dex | `bool` | `false` | no |
| <a name="input_argocd_github_sso_secret"></a> [argocd\_github\_sso\_secret](#input\_argocd\_github\_sso\_secret) | Name of secret contains GitHub app credentials | `string` | n/a | yes |
| <a name="input_argocd_slack_app_secret"></a> [argocd\_slack\_app\_secret](#input\_argocd\_slack\_app\_secret) | Name of secret contains Slack app token | `string` | `"argocd-notifications-secret"` | no |
| <a name="input_argocd_slack_channel"></a> [argocd\_slack\_channel](#input\_argocd\_slack\_channel) | Name of ArgoCD admins-team on GitHub | `string` | `"argocd-channel"` | no |
| <a name="input_argocd_slack_enabled"></a> [argocd\_slack\_enabled](#input\_argocd\_slack\_enabled) | Whether to connect ArgoCD to Slack channel | `bool` | `false` | no |
| <a name="input_awssm_slack_secret_name"></a> [awssm\_slack\_secret\_name](#input\_awssm\_slack\_secret\_name) | Name of AWSSM secret where slack token is stored | `string` | `"argocd-slack-app-token"` | no |
| <a name="input_awssm_sso_secret_name"></a> [awssm\_sso\_secret\_name](#input\_awssm\_sso\_secret\_name) | Name of AWSSM secret | `string` | n/a | yes |
| <a name="input_chart_name"></a> [chart\_name](#input\_chart\_name) | Name of the chart to install | `string` | `"argo-cd"` | no |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | Version of the chart to install | `string` | `"7.7.0"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_cluster_oidc_issuer_url"></a> [cluster\_oidc\_issuer\_url](#input\_cluster\_oidc\_issuer\_url) | cluster\_oidc\_issuer\_url | `string` | n/a | yes |
| <a name="input_cluster_secret_store_ref_name"></a> [cluster\_secret\_store\_ref\_name](#input\_cluster\_secret\_store\_ref\_name) | ClusterSecretStore name | `string` | n/a | yes |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | Create the namespace if it does not exist | `bool` | `true` | no |
| <a name="input_ecr_reg_enabled"></a> [ecr\_reg\_enabled](#input\_ecr\_reg\_enabled) | Whether sync ArgoCD to ECR registry | `bool` | `false` | no |
| <a name="input_extension_url"></a> [extension\_url](#input\_extension\_url) | Argo-Rollouts extension package | `string` | `"https://github.com/argoproj-labs/rollout-extension/releases/download/v0.3.5/extension.tar"` | no |
| <a name="input_github_admins_team"></a> [github\_admins\_team](#input\_github\_admins\_team) | Name of ArgoCD admins-team on GitHub | `string` | `"argocd-admins"` | no |
| <a name="input_github_org"></a> [github\_org](#input\_github\_org) | GitOps repository organization | `string` | `""` | no |
| <a name="input_github_repositories"></a> [github\_repositories](#input\_github\_repositories) | n/a | `list(string)` | `[]` | no |
| <a name="input_github_repositories_enabled"></a> [github\_repositories\_enabled](#input\_github\_repositories\_enabled) | Connect repositories to ArgoCD | `bool` | `false` | no |
| <a name="input_gitops_repo"></a> [gitops\_repo](#input\_gitops\_repo) | GitOps repository name | `string` | `"gitops"` | no |
| <a name="input_gitops_repo_enabled"></a> [gitops\_repo\_enabled](#input\_gitops\_repo\_enabled) | Whether sync ArgoCD to GitOps repository | `bool` | `false` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | Hostname of argocd | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace to install the chart into | `string` | n/a | yes |
| <a name="input_negative_feedback"></a> [negative\_feedback](#input\_negative\_feedback) | Whether to get negattive notifications from ArgoCD | `bool` | `true` | no |
| <a name="input_possitive_feedback"></a> [possitive\_feedback](#input\_possitive\_feedback) | Whether to get possitive notifications from ArgoCD | `bool` | `false` | no |
| <a name="input_recreate_pods"></a> [recreate\_pods](#input\_recreate\_pods) | Recreate pods in the deployment if necessary | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_release_name"></a> [release\_name](#input\_release\_name) | Name of release | `string` | n/a | yes |
| <a name="input_repository"></a> [repository](#input\_repository) | Repository to install the chart from | `string` | `"https://argoproj.github.io/argo-helm"` | no |
| <a name="input_serviceaccount"></a> [serviceaccount](#input\_serviceaccount) | Serviceaccount name to install the chart into | `string` | `"argocd"` | no |
| <a name="input_slack_poc_enabled"></a> [slack\_poc\_enabled](#input\_slack\_poc\_enabled) | Whether to test your slack channel with ArgoCD notification | `bool` | `false` | no |
| <a name="input_sso_enabled"></a> [sso\_enabled](#input\_sso\_enabled) | Whether to use ArgoCD SSO | `bool` | `false` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | Timeout for the helm release | `number` | `3000` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_argocd_url"></a> [argocd\_url](#output\_argocd\_url) | n/a |
<!-- END_TF_DOCS -->
