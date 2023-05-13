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
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 4.5.0"
    }
    # digitalocean = {
    #   source  = "digitalocean/digitalocean"
    #   version = ">= 2.28.1"
    # }
    github = {
      source  = "integrations/github"
      version = ">= 5.24.0"
    }
  }
}

## AWS

# Set `AWS_REGION`, `AWS_ACCESS_KEY_ID`, and `AWS_SECRET_ACCESS_KEY`
# REF: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {}

## Cloudflare

# Set `CLOUDFLARE_API_KEY` or `CLOUDFLARE_API_TOKEN`
# API TOKENS: https://dash.cloudflare.com/profile/api-tokens
# REF: https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs
provider "cloudflare" {}

# provider "cloudflare" {
#   # Configuration options
# }

## DigitalOcean

# provider "digitalocean" {
#   # Configuration options
# }

# Set `GITHUB_TOKEN`
# REF: https://registry.terraform.io/providers/integrations/github/latest/docs
# Token Info
# > Token Name: terraform-infrastructure-github-token
# > Token Permissions: read:discussion, read:org
# > Token Settings URL: https://github.com/settings/tokens
provider "github" {}
