# VARIABLES: https://app.terraform.io/app/jason-riddle/workspaces/infrastructure/variables

terraform {
  required_version = ">= 0.13.0"

  cloud {
    organization = "org-jasonriddle"

    workspaces {
      name = "terraform-credentials"
    }
  }

  required_providers {
    # tfe = {
    #   source  = "hashicorp/tfe"
    #   version = ">= 0.44.1"
    # }
  }
}

## Terraform Cloud/Enterprise
