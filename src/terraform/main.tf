## Label

module "label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"
  enabled = true

  namespace   = var.namespace
  environment = var.environment
  stage       = var.stage
}

## AWS

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

locals {
  # Prior to Kubernetes 1.19, the usage of the specific kubernetes.io/cluster/* resource tags below are required
  # for EKS and Kubernetes to discover and manage networking resources
  # https://www.terraform.io/docs/providers/aws/guides/eks-getting-started.html#base-vpc-networking
  tags = { "kubernetes.io/cluster/${module.label.id}" = "shared" }
}

module "vpc" {
  source  = "cloudposse/vpc/aws"
  version = "2.1.0"
  enabled = false

  tags    = local.tags
  context = module.label.context
}

module "subnets" {
  source  = "cloudposse/dynamic-subnets/aws"
  version = "2.1.0"
  enabled = false

  vpc_id = module.vpc.vpc_id

  nat_gateway_enabled  = false
  nat_instance_enabled = false

  tags    = local.tags
  context = module.label.context
}


module "eks_cluster" {
  source  = "cloudposse/eks-cluster/aws"
  version = "2.8.0"
  enabled = false

  vpc_id = module.vpc.vpc_id

  subnet_ids = module.subnets.public_subnet_ids

  context = module.label.context
}

module "ssm_patch_manager" {
  source  = "cloudposse/ssm-patch-manager/aws"
  version = "0.4.0"
  enabled = false

  region = "us-west-1"

  context = module.label.context
}

## Cloudflare

# DOCS: https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs

# jasonriddle.com
data "cloudflare_zone" "jasonriddle_com" {
  name = "jasonriddle.com"
}

# jasonriddle.com
module "cloudflare_zone_jasonriddle_com" {
  source  = "cloudposse/zone/cloudflare"
  version = "0.5.0"
  enabled = true

  account_id   = "7880ee87feea1839fb5a815cc479b080"
  zone         = "jasonriddle.com"
  zone_enabled = false

  records = [
    # Google Site Verification
    {
      name    = "jasonriddle.com"
      value   = "google-site-verification=bl5rOxJb15yoC3-RP291bMktkMzrZrrKDLyFvAEXaMs"
      type    = "TXT"
      ttl     = 1
      proxied = false
    },
    # jasonriddle.com
    {
      name    = "jasonriddle.com"
      value   = "185.212.71.169"
      type    = "A"
      ttl     = 1
      proxied = true
    },
    # newsletter.jasonriddle.com
    {
      name    = "newsletter"
      value   = "target.substack-custom-domains.com"
      type    = "CNAME"
      ttl     = 1
      proxied = false
    },
    # social.jasonriddle.com
    {
      name    = "social"
      value   = "vip.masto.host"
      type    = "CNAME"
      ttl     = 1
      proxied = false
    },
    # store.jasonriddle.com
    {
      name    = "store"
      value   = "domains.gumroad.com"
      type    = "CNAME"
      ttl     = 1
      proxied = false
    },
    # www.jasonriddle.com
    {
      name    = "www"
      value   = "185.212.71.169"
      type    = "A"
      ttl     = 1
      proxied = true
    },
    # Fastmail
    # Allows you to receive email at standard addresses, e.g. user@jasonriddle.com
    {
      name     = "jasonriddle.com"
      value    = "in1-smtp.messagingengine.com"
      type     = "MX"
      priority = 10
      ttl      = 1
      proxied  = false
    },
    # Fastmail
    # Allows you to receive email at standard addresses, e.g. user@jasonriddle.com
    # {
    #   name     = "jasonriddle.com"
    #   value    = "in2-smtp.messagingengine.com"
    #   type     = "MX"
    #   priority = 20
    #   ttl      = 1
    #   proxied  = false
    # },
    # TODO: Not able to add these recods due to duplicate error key
    # SEE: https://github.com/jason-riddle/infrastructure/actions/runs/5042180187/jobs/9042553889#step:10:56
    # Fastmail
    # Allows you to receive email at subdomain addresses, e.g. foo@user.jasonriddle.com
    {
      name     = "*"
      value    = "in1-smtp.messagingengine.com"
      type     = "MX"
      priority = 10
      ttl      = 1
      proxied  = false
    },
    # Fastmail
    # Allows you to receive email at subdomain addresses, e.g. foo@user.jasonriddle.com
    # {
    #   name     = "*"
    #   value    = "in2-smtp.messagingengine.com"
    #   type     = "MX"
    #   priority = 20
    #   ttl      = 1
    #   proxied  = false
    # }
  ]

  context = module.label.context
}

# Fastmail
# Allows you to receive email at standard addresses, e.g. user@jasonriddle.com
resource "cloudflare_record" "jasonriddle_com_10_in2-smtp_messagingengine_com" {
  count = 1

  zone_id  = data.cloudflare_zone.jasonriddle_com.id
  name     = "jasonriddle.com"
  value    = "in2-smtp.messagingengine.com"
  type     = "MX"
  priority = 20
  ttl      = 1
  proxied  = false

  lifecycle {
    prevent_destroy = true
  }
}

# Fastmail
# Allows you to receive email at subdomain addresses, e.g. foo@user.jasonriddle.com
resource "cloudflare_record" "wildcard_jasonriddle_com_20_in1-smtp_messagingengine_com" {
  count = 1

  zone_id  = data.cloudflare_zone.jasonriddle_com.id
  name     = "*"
  value    = "in2-smtp.messagingengine.com"
  type     = "MX"
  priority = 20
  ttl      = 1
  proxied  = false

  lifecycle {
    prevent_destroy = true
  }
}

# jrapps.org
module "cloudflare_zone_jrapps_org" {
  source  = "cloudposse/zone/cloudflare"
  version = "0.5.0"
  enabled = true

  account_id   = "7880ee87feea1839fb5a815cc479b080"
  zone         = "jrapps.org"
  zone_enabled = false
  records = [
    # nextcloud.jrapps.org
    {
      name    = "nextcloud"
      value   = "nx15310.your-storageshare.de"
      type    = "CNAME"
      ttl     = 1
      proxied = false
    }
  ]

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

## GitHub

data "github_repository" "infrastructure" {
  full_name = "jason-riddle/infrastructure"
}

resource "github_branch_protection" "infrastructure" {
  count = 1

  repository_id = data.github_repository.infrastructure.node_id

  pattern                 = "main"
  allows_deletions        = false
  required_linear_history = true

  required_status_checks {
    strict = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

## Google

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

## Terraform Cloud/Enterprise

## Twilio

## Vault

# resource "vault_namespace" "example" {
#   path = "example"
# }
