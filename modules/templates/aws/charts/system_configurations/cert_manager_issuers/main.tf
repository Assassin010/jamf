## Cert Manager Cluster Issuer - Staging issuer - NOT FOR PRODUCTION
resource "kubernetes_manifest" "letsencrypt_cluster_issuer_staging" {
  count = var.cert_manager_issuer_staging_mode == true ? 1 : 0
  manifest = yamldecode(<<-EOT
    apiVersion: cert-manager.io/v1
    kind: ClusterIssuer
    metadata:
      name: letsencrypt-staging
    spec:
      acme:
        email: ${var.issuer_email}
        server: https://acme-staging-v02.api.letsencrypt.org/directory
        privateKeySecretRef:
          # Secret resource that will be used to store the account's private key.
          name: "${var.cluster_name}-letsencrypt-key"
        solvers:
        - http01:
            ingress:
              class: ${var.ingress_class_name}
    EOT
  )
}
resource "kubernetes_manifest" "letsencrypt_cluster_issuer_prod" {
  count = var.cert_manager_issuer_production_mode == true ? 1 : 0
  manifest = yamldecode(<<-EOT
    apiVersion: cert-manager.io/v1
    kind: ClusterIssuer
    metadata:
      name: letsencrypt-prod
    spec:
      acme:
        email: ${var.issuer_email}
        server: https://acme-v02.api.letsencrypt.org/directory
        privateKeySecretRef:
          # Secret resource that will be used to store the account's private key.
          name: "${var.cluster_name}-letsencrypt-priv-key"
        solvers:
        - http01:
            ingress:
              class: ${var.ingress_class_name}
    EOT
  )
}

# module "issuers" {
#   depends_on = [ module.cert_manager_helm ]
#   cert_manager_id = module.cert_manager_helm.id
#   source = "./issuers"
#   cluster_name = var.cluster_name
#   issuer_email = var.issuer_email
#   cert_manager_issuer_staging_mode = var.cert_manager_issuer_staging_mode
# }



# # # SAVING FOR LATER:
# # # resource "kubernetes_manifest" "letsencrypt_cluster_issuer_prod" {
# # #   manifest = yamldecode(<<-EOT
# # #     apiVersion: cert-manager.io/v1
# # #     kind: ClusterIssuer
# # #     metadata:
# # #       name: letsencrypt-prod
# # #     spec:
# # #       acme:
# # #         email: aleksei.karpelev@opsfleet.com
# # #         server: https://acme-v02.api.letsencrypt.org/directory
# # #         privateKeySecretRef:
# # #           # Secret resource that will be used to store the account's private key.
# # #           name: "${var.cluster_name}-letsencrypt-priv-key"
# # #         solvers:
# # #         - http01:
# # #             ingress:
# # #               class: nginx
# # #     EOT
# # #     )
# # # }
