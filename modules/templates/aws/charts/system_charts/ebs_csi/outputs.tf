output "id" {
  value = one(helm_release.ebs_csi[*].id)
}