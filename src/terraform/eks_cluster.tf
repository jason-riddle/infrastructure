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
