module "eks_managed_node_groups" {
  source               = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
  version              = "20.31.3"
  create               = var.create_managed_node_groups
  subnet_ids           = var.nodegroup_subnet_ids
  name                 = var.name
  cluster_name         = var.cluster_name
  cluster_service_cidr = var.cluster_service_cidr
  cluster_version      = var.cluster_version
  ami_type             = var.ami_type
  min_size             = var.min_size
  max_size             = var.max_size
  desired_size         = var.desired_size
  instance_types       = var.instance_types
  capacity_type        = var.capacity_type
  tag_specifications   = var.tag_specifications

  tags = var.tags

  create_iam_role                   = true
  iam_role_name                     = var.iam_node_group_role
  iam_role_use_name_prefix          = false
  iam_role_attach_cni_policy        = true
  iam_role_additional_policies      = merge({ "additional_policy" = module.additional_policy.arn }, var.iam_role_nodes_additional_policies)
  network_interfaces                = var.network_interfaces
  cluster_primary_security_group_id = var.cluster_primary_security_group_id
  enable_monitoring                 = true
  block_device_mappings = {
    xvda = {
      device_name = "/dev/xvda"
      ebs = {
        volume_size           = 300
        volume_type           = "gp3"
        iops                  = 3000
        throughput            = 150
        encrypted             = true
        kms_key_id            = var.ebs_kms_key_arn
        delete_on_termination = true
      }
    }
  }

  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
    instance_metadata_tags      = "enabled"
  }
  user_data_template_path = ""

  vpc_security_group_ids = var.vpc_security_group_ids
}

resource "aws_autoscaling_policy" "eks_autoscaling_policy" {
  count                  = var.create_managed_node_groups ? length(var.eks_managed_node_groups) : 0
  name                   = "${element(module.eks_managed_node_groups.node_group_autoscaling_group_names, count.index)}-autoscaling-policy"
  autoscaling_group_name = element(module.eks_managed_node_groups.node_group_autoscaling_group_names, count.index)
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = var.autoscaling_average_cpu
  }
  depends_on = [module.eks_managed_node_groups]
}

module "additional_policy" {
  source        = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version       = "5.39.0"
  create_policy = true
  name          = "${var.node_add_policy_name}-additional-policy-${random_id.additional_id.hex}"
  path          = "/"
  description   = "Additional policy for eks node group"
  policy        = data.aws_iam_policy_document.additional_policy.json

  tags = {
    PolicyDescription = "Policy created using example from data source"
  }
}

resource "random_id" "additional_id" {
  # count       = var.create_managed_node_groups ? 1 : 0
  byte_length = 8
}

data "aws_iam_policy_document" "additional_policy" {
  statement {
    actions = [
      "ecr:GetAuthorizationToken",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:GetRepositoryPolicy",
      "ecr:DescribeRepositories",
      "ecr:ListImages",
      "ecr:DescribeImages",
      "ecr:BatchGetImage",
      "ecr:GetLifecyclePolicy",
      "ecr:GetLifecyclePolicyPreview",
      "ecr:ListTagsForResource",
      "ecr:DescribeImageScanFindings",
      "ec2:*",
      "elasticfilesystem:*",
      "logs:*",
      "iam:PassRole",
      "logs:*",
      "events:*"
    ]
    effect    = "Allow"
    resources = ["*"]
  }
}
