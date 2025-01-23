output "id" {
  value = one(helm_release.airflow[*].id)
}