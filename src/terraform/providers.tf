# VARIABLES: https://app.terraform.io/app/jason-riddle/workspaces/infrastructure/variables

terraform {
  required_version = ">= 0.13.0"

  cloud {
    organization = "jason-riddle"

    workspaces {
      name = "infrastructure"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.64.0"
    }
    # boundary = {
    #   source  = "hashicorp/boundary"
    #   version = ">= 1.1.7"
    # }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 4.5.0"
    }
    # consul = {
    #   source  = "hashicorp/consul"
    #   version = ">= 2.17.0"
    # }
    # digitalocean = {
    #   source  = "digitalocean/digitalocean"
    #   version = ">= 2.28.1"
    # }
    github = {
      source  = "integrations/github"
      version = ">= 5.24.0"
    }
    # google = {
    #   source  = "hashicorp/google"
    #   version = ">= 4.66.0"
    # }
    # helm = {
    #   source  = "hashicorp/helm"
    #   version = ">= 2.9.0"
    # }
    # hcp = {
    #   source  = "hashicorp/hcp"
    #   version = ">= 0.56.0"
    # }
    # REF: https://github.com/cloudposse/terraform-aws-eks-cluster/issues/188#issuecomment-1574399123
    # kubernetes = {
    #   source  = "hashicorp/kubernetes"
    #   version = ">= 2.10.0, != 2.21.0"
    # }
    # namecheap = {
    #   source  = "namecheap/namecheap"
    #   version = ">= 2.1.0"
    # }
    # nomad = {
    #   source  = "hashicorp/nomad"
    #   version = ">= 1.4.20"
    # }
    tailscale = {
      source  = "tailscale/tailscale"
      version = ">= 0.13.7"
    }
    # tfe = {
    #   source  = "hashicorp/tfe"
    #   version = ">= 0.44.1"
    # }
    # twilio = {
    #   source  = "twilio/twilio"
    #   version = ">= 0.18.21"
    # }
    vantage = {
      source  = "vantage-sh/vantage"
      version = "0.0.2"
    }
    # vault = {
    #   source  = "hashicorp/vault"
    #   version = ">= 3.15.2"
    # }
  }
}

## AWS

# Set `AWS_REGION`, `AWS_ACCESS_KEY_ID`, and `AWS_SECRET_ACCESS_KEY`
# REF: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {}

## Boundary

## Cloudflare

# Set (`CLOUDFLARE_API_KEY` and `CLOUDFLARE_EMAIL`) or `CLOUDFLARE_API_TOKEN`
# API TOKENS: https://dash.cloudflare.com/profile/api-tokens
# REF: https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs
provider "cloudflare" {}

## Consul

## DigitalOcean

# Set `DIGITALOCEAN_TOKEN` or `DIGITALOCEAN_ACCESS_TOKEN`
# API TOKENS: https://cloud.digitalocean.com/account/api/tokens
# REF: https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs
# provider "digitalocean" {}

## GitHub

# Set `GITHUB_TOKEN`
# REF: https://registry.terraform.io/providers/integrations/github/latest/docs
# Token Info
# > Token Name: terraform-infrastructure-github-token
# > Token Permissions: public_repo, read:discussion, read:org
# > Token Settings URL: https://github.com/settings/tokens
provider "github" {}

## Google

# Set `GOOGLE_CREDENTIALS`
# REF: https://registry.terraform.io/providers/hashicorp/google/latest/docs
# REF: https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference
# provider "google" {}

## Helm

## HCP

# Set `HCP_CLIENT_ID` and `HCP_CLIENT_SECRET`
# REF: https://registry.terraform.io/providers/hashicorp/hcp/latest/docs
# Service Principal Info
# > Service Principal ID: terraform-infrastructure-system-user
# > Service Principal Role: Contributor
# > Service Principal URL: https://portal.cloud.hashicorp.com/access/service-principals/terraform-infrastructure-system-user-122151@c3fd7556-9d82-49b1-9138-0207ce01936d?org_id=c3fd7556-9d82-49b1-9138-0207ce01936d
provider "hcp" {}

## Kubernetes

## Namecheap

## Nomad

## Tailscale

# Set `TAILSCALE_API_KEY`
# REF: https://registry.terraform.io/providers/tailscale/tailscale/latest/docs
provider "tailscale" {}

## Terraform Cloud/Enterprise

## Twilio

## Vantage

## Vault

# data "hcp_vault_cluster" "vault" {
#   cluster_id = hcp_vault_cluster.vault[0].cluster_id
# }

# Set `VAULT_ADDR`
# REF: https://registry.terraform.io/providers/hashicorp/vault/latest/docs
# provider "vault" {
#   address = "http://127.0.0.1:8200"
# }

# Set `VAULT_ADDR` and `VAULT_TOKEN`
# REF: https://registry.terraform.io/providers/hashicorp/vault/latest/docs
# provider "vault" {
#   address = data.hcp_vault_cluster.vault.vault_public_endpoint_url
#   token   = hcp_vault_cluster_admin_token.cluster_token[0].token
# }
