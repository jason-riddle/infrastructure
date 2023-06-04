## eks_cluster.tf - EKS Cluster + Subnets + VPC

locals {
  # Prior to Kubernetes 1.19, the usage of the specific kubernetes.io/cluster/* resource tags below are required
  # for EKS and Kubernetes to discover and manage networking resources
  # https://www.terraform.io/docs/providers/aws/guides/eks-getting-started.html#base-vpc-networking
  tags = { "kubernetes.io/cluster/${module.label.id}" = "shared" }
}

module "eks_vpc" {
  source  = "cloudposse/vpc/aws"
  version = "2.1.0"
  enabled = false

  ipv4_primary_cidr_block = "10.0.0.0/24"

  assign_generated_ipv6_cidr_block = true

  tags    = local.tags
  context = module.label.context
}

module "eks_subnets" {
  source  = "cloudposse/dynamic-subnets/aws"
  version = "2.3.0"
  enabled = false

  vpc_id = module.eks_vpc.vpc_id

  nat_gateway_enabled  = false
  nat_instance_enabled = false

  tags    = local.tags
  context = module.label.context
}

module "eks_cluster" {
  source  = "cloudposse/eks-cluster/aws"
  version = "2.8.1"
  enabled = false

  vpc_id = module.eks_vpc.vpc_id

  subnet_ids = module.eks_subnets.public_subnet_ids

  context = module.label.context
}

## iam.tf - IAM

module "iam_policy" {
  source  = "cloudposse/iam-policy/aws"
  version = "0.4.0"
  enabled = false

  context = module.label.context
}

module "iam_role" {
  source  = "cloudposse/iam-role/aws"
  version = "0.18.0"
  enabled = false

  role_description = ""

  context = module.label.context
}

module "iam_account_settings" {
  source  = "cloudposse/iam-account-settings/aws"
  version = "0.5.0"
  enabled = false

  context = module.label.context
}

# TODO: bug https://github.com/cloudposse/terraform-aws-iam-assumed-roles/issues/23
# module "iam_assumed_roles" {
#   source  = "cloudposse/iam-assumed-roles/aws"
#   version = "0.6.0"
#   enabled = false
# }

# resource "iam_group" "admin" {
#   count = 0

#   name = "admin"
# }

module "iam_user_jason" {
  source  = "cloudposse/iam-user/aws"
  version = "0.8.4"
  enabled = false

  name   = "iam-user-jason"
  groups = []

  login_profile_enabled   = false
  user_name               = "iam-user-jason"
  pgp_key                 = ""
  password_length         = 24
  password_reset_required = true

  context = module.label.context
}

module "iam_system_user" {
  source  = "cloudposse/iam-system-user/aws"
  version = "1.1.0"
  enabled = false

  name = "iam-system-user"

  ssm_enabled                   = false
  ssm_ses_smtp_password_enabled = false

  context = module.label.context
}

## ssm.tf - SSM

# module "ssm_patch_manager" {
#   source  = "cloudposse/ssm-patch-manager/aws"
#   version = "0.4.0"
#   enabled = false

#   region = "us-west-1"

#   context = module.label.context
# }

## sns.tf - SNS

module "sns_topic" {
  source  = "cloudposse/sns-topic/aws"
  version = "0.21.0"
  enabled = false

  context = module.label.context
}

module "sns_lambda_notify_slack" {
  source  = "cloudposse/sns-lambda-notify-slack/aws"
  version = "0.6.0"
  enabled = false

  slack_webhook_url = "https://hooks.slack.com/services/AAAAAAAA/BBBBBBBB/CCCCCCC"
  slack_channel     = "aws-services"
  slack_username    = "reporter"

  context = module.label.context
}

module "security_group" {
  source  = "cloudposse/security-group/aws"
  version = "2.2.0"
  enabled = false

  vpc_id = module.eks_vpc.vpc_id

  context = module.label.context
}

## s3.tf - S3

module "s3_bucket" {
  source  = "cloudposse/s3-bucket/aws"
  version = "3.1.2"
  enabled = false

  context = module.label.context
}

## DigitalOcean

# resource "digitalocean_kubernetes_cluster" "k8s_cluster" {
#   count = 0

#   name    = "jasons-k8s-cluster"
#   region  = "sfo3"
#   version = "1.26.3-do.0"

#   node_pool {
#     name       = "worker-pool"
#     size       = "s-1vcpu-2gb"
#     node_count = 1
#   }

#   lifecycle {
#     prevent_destroy = true
#   }
# }

## HCP

# resource "hcp_hvn" "hvn" {
#   count = 1

#   hvn_id         = "hvn-aws-us-west-2"
#   cloud_provider = "aws"
#   region         = "us-west-2"
#   cidr_block     = "172.25.16.0/20"

#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "hcp_vault_cluster" "vault" {
#   count = 1

#   cluster_id      = "jasons-vault-cluster"
#   hvn_id          = hcp_hvn.hvn[0].hvn_id
#   public_endpoint = true
#   tier            = "dev"

#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "hcp_vault_cluster_admin_token" "cluster_token" {
#   count = 1

#   cluster_id = hcp_vault_cluster.vault[0].cluster_id
# }

## Tailscale

data "tailscale_devices" "devices" {
  name_prefix = "jasons-"
}

output "tailscale_devices" {
  value = data.tailscale_devices.devices
}

## Vault

# resource "vault_namespace" "example" {
#   path = "example"
# }
