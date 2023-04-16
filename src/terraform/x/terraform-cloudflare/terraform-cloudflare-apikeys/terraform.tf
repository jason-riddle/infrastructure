terraform {
  required_version = ">= 0.15"

  cloud {
    organization = "jason-riddle"

    workspaces {
      name = "terraform-cloudflare-apikeys"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3"
    }
  }
}

# https://developers.cloudflare.com/fundamentals/api/get-started/create-token/
# Set CLOUDFLARE_API_TOKEN.
# provider "cloudflare" {
#   api_token = var.cloudflare_api_token
# }
