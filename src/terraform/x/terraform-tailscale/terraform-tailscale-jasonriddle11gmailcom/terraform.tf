terraform {
  required_version = ">= 0.15"

  cloud {
    organization = "jason-riddle"

    workspaces {
      name = "terraform-tailscale-jasonriddle11gmailcom"
    }
  }

  required_providers {
    tailscale = {
      source  = "tailscale/tailscale"
      version = "~> 0.13"
    }
  }
}
