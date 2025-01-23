locals {
  base_values = templatefile("${path.module}/values.yaml", {
    cluster_name = var.cluster_name
    sa_name      = var.serviceaccount
    release_name = var.name
  })
}
