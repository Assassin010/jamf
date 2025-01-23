output "certificate_issuer_name_staging" {
  value = kubernetes_manifest.letsencrypt_cluster_issuer_staging[*].manifest.metadata.name
}
output "certificate_issuer_name_prod" {
  value = kubernetes_manifest.letsencrypt_cluster_issuer_prod[*].manifest.metadata.name
}