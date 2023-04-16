terraform {
  required_version = ">= 0.15"

  cloud {
    organization = "jason-riddle"

    workspaces {
      name = "terraform-twilio-15106982306"
    }
  }

  required_providers {
    twilio = {
      source = "twilio/twilio"
      version = "~> 0.18"
    }
  }
}
