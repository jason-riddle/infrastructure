locals {
  enabled = var.enabled
}

# WIP: Enable login profile and fill in namespace, environment, etc.
module "aws_jason_console_read_only_access" {
  source  = "cloudposse/iam-user/aws"
  version = "0.8.4"

  namespace   = "jr"
  environment = "infrastructure"
  stage       = ""
  name        = "jason-console-read-only-access"
  attributes  = []

  # Enable the IAM user
  enabled               = local.enabled
  login_profile_enabled = false
  user_name             = "jason-console-read-only-access"
  pgp_key               = ""
}