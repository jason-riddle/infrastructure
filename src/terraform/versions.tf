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
  }
}

provider "aws" {
  region = "us-west-1"
}

# https://github.com/settings/tokens
# GitHub - Jason's iMac - Jason Riddle Infrastructure
# public_repo, read:org, read:discussion

# export GITHUB_TOKEN=ghp_
provider "github" {
  # Configuration options
}
