terraform {
  required_version = ">= 0.15"

  cloud {
    organization = "jason-riddle"

    workspaces {
      name = "terraform-remote-backups-website-jasonriddlecom"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-west-1"
}
