terraform {
  required_version = ">= 0.15"

  cloud {
    organization = "jason-riddle"

    workspaces {
      name = "terraform-aws-iam-user-jason"
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
