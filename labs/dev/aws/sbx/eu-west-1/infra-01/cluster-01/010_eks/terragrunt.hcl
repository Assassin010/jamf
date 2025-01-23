terraform {
  source = "${get_repo_root()}/modules/templates/aws/eks"
}

# For Inputs
include "root" {
  path   = find_in_parent_folders()
  expose = true
}

# For AWS provider & tfstate S3 backand
include "cloud" {
  path = find_in_parent_folders("cloud.hcl")
}

# # For Helm, Kubectl & GitHub providers
# include "common_providers" {
#   path = find_in_parent_folders("providers.hcl")
# }

dependency "vpc" {
  config_path = "../../vpc"
  mock_outputs = {
    vpc_id             = "vpc-1234"
    public_subnets     = ["subnet-1", "subnet-2", "subnet-3"]
    private_subnets    = ["subnet-4", "subnet-5", "subnet-6"]
    database_subnets   = ["subnet-7", "subnet-8", "subnet-9"]
    r53_parent_zone_id = "zone_id"
  }
}

locals {
  r53_hosted_zone_name         = include.root.locals.my_account_conf.locals.r53_hosted_zone_name
  common_tags                  = include.root.locals.my_env_conf.inputs.common_tags
  kubernets_version            = include.root.locals.my_stack_conf.locals.kubernets_version
  cluster_name                 = read_terragrunt_config(find_in_parent_folders("cluster.hcl")).locals.cluster_name
  worker_nodes_kms_key_aliases = [format("eks/kms/sao/%s/ebs", local.cluster_name)]
}

inputs = {
  vpc_id                       = dependency.vpc.outputs.vpc_id
  public_subnet_ids            = dependency.vpc.outputs.public_subnets
  private_subnet_ids           = dependency.vpc.outputs.private_subnets
  cluster_name                 = local.cluster_name
  worker_nodes_kms_key_aliases = local.worker_nodes_kms_key_aliases
  kubernets_version            = local.kubernets_version
  r53_hosted_zone_name         = local.r53_hosted_zone_name
  tags                         = local.common_tags
  create_managed_node_groups   = true

  node_security_group_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "owned"
  }

  # For Node Group
  nodegroup_subnet_ids    = dependency.vpc.outputs.public_subnets
  autoscaling_average_cpu = 30
  eks_managed_node_groups = {
    "my-app-eks-x86" = {
      ami_type     = "AL2_x86_64"
      min_size     = 2
      max_size     = 16
      desired_size = 3
      instance_types = [
        "m7i.4xlarge"
        # "t3.small",
        # "t3.medium",
        # "t3.large"
      ]
      capacity_type = "ON_DEMAND"
      # use_custom_launch_template = false
      # disk_size                  = 300
      network_interfaces = [{
        delete_on_termination       = true
        associate_public_ip_address = true
      }]
    }
    # "my-app-eks-arm" = {
    #   ami_type     = "AL2_ARM_64"
    #   min_size     = 3
    #   max_size     = 16
    #   desired_size = 3
    #   instance_types = [
    #     "c7g.medium",
    #     "c7g.large"
    #   ]
    #   capacity_type = "ON_DEMAND"
    #   # use_custom_launch_template = false
    #   # disk_size                  = 300
    #   network_interfaces = [{
    #     delete_on_termination       = true
    #     associate_public_ip_address = true
    #   }]
    # }
  }
  iam_node_group_role  = "${local.cluster_name}-node-group-role"
  node_add_policy_name = "${local.cluster_name}-node-additional-policy"
  iam_role_nodes_additional_policies = {
    worker_node_policy                  = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    cni_policy                          = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    cloudwatch_agent_policy             = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
    ssm_managed_instance_core_policy    = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    vpc_resource_controller_policy      = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController",
    AmazonEC2ContainerServiceforEC2Role = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role",
    CloudWatchFullAccess                = "arn:aws:iam::aws:policy/CloudWatchFullAccess",
    CloudWatchLogsFullAccess            = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess",
    AmazonEC2ContainerServiceforEC2Role = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
  }

  developer_users      = ["Terraform", "tst"]
  developer_roles      = ["CrossplaneRole"]
  developer_user_group = "devepers-user-group"
  kubernetes_groups    = local.cluster_name

  oic_role_configurations = {
    aws-load-balancer-controller-argocd = {
      role_name           = "aws-load-balancer-controller1"
      assume_role_actions = ["sts:AssumeRoleWithWebIdentity"]
      service_account     = "aws-load-balancer-controller"
      namespace           = "good"
      policy_file         = "aws-load-balancer-controller.json"
    }
    # aws-load-balancer-controller-kube-system = {
    #   role_name           = "aws-load-balancer-controller-kube-system"
    #   assume_role_actions = ["sts:AssumeRoleWithWebIdentity"]
    #   service_account     = "aws-load-balancer-controller"
    #   namespace           = "kube-system"
    #   policy_file         = "aws-load-balancer-controller.json"
    # }
  }
  create_fargate_profile = true
  fargate_profiles = {
    "my-app-eks-fargate" = {
      name          = "demo"
      namespace     = "demo"
      iam_role_name = "${local.cluster_name}-fargate-role"
      selectors = [
        {
          namespace = "demo"
          labels    = {}
        }
      ]
      additional_policies = {
        "AmazonEKSFargatePodExecutionRolePolicy" = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
      }
    }
  }

  # EKS Cluster Addons
  enable_eks_addons = true
  addons = [
    {
      addon_name = "amazon-cloudwatch-observability"
      # addon_version            = ""
      # service_account_role_arn = ""
    }
  ]
}
