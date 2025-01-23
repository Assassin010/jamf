module "karpenter" {
  source                          = "terraform-aws-modules/eks/aws//modules/karpenter"
  version                         = "~> 19.21"
  cluster_name                    = var.cluster_name
  irsa_use_name_prefix            = false
  irsa_oidc_provider_arn          = var.cluster_oidc_provider_arn
  irsa_namespace_service_accounts = ["${var.namespace}:${var.serviceaccount}"]
  iam_role_use_name_prefix        = false

  iam_role_additional_policies = {
    AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }

  enable_karpenter_instance_profile_creation = true
}

resource "null_resource" "wait" {
  triggers = {
    run_at_first_tf_apply = module.karpenter.irsa_arn
  }
  provisioner "local-exec" {
    command = "sleep 90"
  }
}

resource "helm_release" "karpenter" {
  ### If we dont wait, alb controller might not be ready which causes helm release to fail
  depends_on       = [null_resource.wait]
  namespace        = var.namespace
  create_namespace = var.namespace == "kube-system" ? false : true
  version          = var.chart_version
  name             = var.name
  repository       = "oci://public.ecr.aws/karpenter"
  chart            = "karpenter"
  values           = [local.base_values]
  wait             = var.wait
}



resource "kubectl_manifest" "karpenter_node_class" {
  depends_on = [helm_release.karpenter]
  yaml_body  = local.ec2_node_class_yaml

  lifecycle {
    precondition {
      condition     = fileexists(local.ec2_node_class_yaml_path)
      error_message = " --> Error: Failed to find '${local.ec2_node_class_yaml_path}'. Exit terraform process."
    }
  }

}

resource "kubectl_manifest" "karpenter_node_pool" {
  depends_on = [helm_release.karpenter]
  yaml_body  = local.node_pool_yaml
  lifecycle {
    precondition {
      condition     = fileexists(local.node_pool_yaml_path)
      error_message = " --> Error: Failed to find '${local.node_pool_yaml_path}'. Exit terraform process."
    }
  }
}

resource "kubectl_manifest" "karpenter_inflate_deployment" {
  depends_on = [helm_release.karpenter]
  yaml_body  = local.inflate_deployment_yaml

  lifecycle {
    precondition {
      condition     = fileexists(local.inflate_deployment_yaml_path)
      error_message = " --> Error: Failed to find '${local.inflate_deployment_yaml_path}'. Exit terraform process."
    }
  }
}


resource "kubernetes_config_map_v1_data" "aws_auth" {
  force = true
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = local.aws_auth_configmap_data

}
