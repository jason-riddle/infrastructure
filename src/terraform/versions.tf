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
    github = {
      source  = "integrations/github"
      version = ">= 5.23.0"
    }
  }
}

provider "github" {
  # Configuration options
}
