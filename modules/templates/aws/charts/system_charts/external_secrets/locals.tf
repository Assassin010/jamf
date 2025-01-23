locals {
  values_yaml_path               = "${path.module}/yamls/values.yaml"
  cluster_secret_store_yaml_path = "${path.module}/yamls/cluster-secret-store.yaml"

  external_secrets_values_yaml = templatefile(local.values_yaml_path, {
    region       = var.region
    sa_name      = var.serviceaccount
    irsa_role    = module.external_secrets_irsa_role.iam_role_arn
    release_name = var.name
  })

  cluster_secret_store_yaml = templatefile(local.cluster_secret_store_yaml_path, {
    region         = var.region
    namespace      = var.namespace
    serviceaccount = var.serviceaccount
  })
}