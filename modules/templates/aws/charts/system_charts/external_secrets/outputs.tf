output "cluster_secret_store_ref_name" {
  value = kubectl_manifest.cluster-secret-store.name
}