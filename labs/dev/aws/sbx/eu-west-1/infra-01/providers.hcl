locals {
  github_org          = read_terragrunt_config(find_in_parent_folders("org.hcl")).locals.github_org
  github_token        = get_env("TF_VAR_github_token", "none")
  github_provider     = strcontains(basename(get_terragrunt_dir()), "engines")
  kubernetes_provider = (strcontains(basename(get_terragrunt_dir()), "engines") || strcontains(basename(get_terragrunt_dir()), "charts"))
}

generate "providers" {
  path      = "providers.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "helm" {
  kubernetes {
    host                   = "${dependency.eks.outputs.cluster_endpoint}"
    cluster_ca_certificate = "${replace(base64decode(dependency.eks.outputs.cluster_certificate_authority_data), "\n", "\\n")}"
    
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args        = ["eks", "get-token", "--cluster-name", "${dependency.eks.outputs.cluster_name}"]
    }
  }
}

provider "kubectl" {
  host                   = "${dependency.eks.outputs.cluster_endpoint}"
  cluster_ca_certificate = "${replace(base64decode(dependency.eks.outputs.cluster_certificate_authority_data), "\n", "\\n")}"
  load_config_file       = false
  apply_retry_count      = 5
    
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", "${dependency.eks.outputs.cluster_name}"]
  }
}

%{if local.kubernetes_provider~}
provider "kubernetes" {
  host                   = "${dependency.eks.outputs.cluster_endpoint}"
  cluster_ca_certificate = "${replace(base64decode(dependency.eks.outputs.cluster_certificate_authority_data), "\n", "\\n")}"
   
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", "${dependency.eks.outputs.cluster_name}"]
  }
}
%{endif~}

%{if local.github_provider~}
provider "github" {
  owner = "${local.github_org}"
%{if local.github_token != "none"~}
  token = "${local.github_token}"
%{endif~}
}
%{endif~}
  EOF
}
