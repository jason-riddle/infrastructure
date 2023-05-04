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

provider "aws" {
  # Configuration options
  region = "us-west-1"
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
# export GITHUB_TOKEN=ghp_
provider "github" {
  # Configuration options
  token = var.token # or `GITHUB_TOKEN`
}
