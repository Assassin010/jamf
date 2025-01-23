locals {

  ecr_authorization_token_yaml_path = "${path.module}/yamls/ecr-authorization-token.yaml"
  ecr_generator_yaml_path           = "${path.module}/yamls/ecr-generator.yaml"

  ecr_url = "${var.account_id}.dkr.ecr.${var.region}.amazonaws.com"

  ecr_authorization_token_yaml = templatefile(local.ecr_authorization_token_yaml_path, {
    namespace      = var.namespace
    region         = var.region
    serviceaccount = var.serviceaccount
  })

  ecr_generator_yaml = templatefile(local.ecr_generator_yaml_path, {
    namespace         = var.namespace
    ecr_registry_name = var.ecr_registry_name
    ecr_url           = local.ecr_url
    kind              = kubectl_manifest.ecr-authorization-token.kind
    name              = kubectl_manifest.ecr-authorization-token.name
  })
}