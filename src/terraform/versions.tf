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
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.28.1"
    }
    github = {
      source  = "integrations/github"
      version = ">= 5.24.0"
    }
  }
}

## AWS

# REF: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {
  # Configuration options
  region = "us-west-1" # or `AWS_REGION`
}

## Cloudflare

# provider "cloudflare" {
#   # Configuration options
# }

## DigitalOcean

# provider "digitalocean" {
#   # Configuration options
# }

# https://github.com/settings/tokens
# GitHub - Jason's iMac - Jason Riddle Infrastructure
# public_repo, read:org, read:discussion

# REF: https://registry.terraform.io/providers/integrations/github/latest/docs
# Set token with `export GITHUB_TOKEN` or define `TF_VAR_github_token`.
provider "github" {
  # Configuration options

  # export 'TF_VAR_github_token' to set `var.github_token`
  token = var.github_token
}
