locals {
  enabled = var.enabled
}

# WIP: Enable login profile and fill in namespace, environment, etc.
module "aws_console_jason_read_only_access" {
  source  = "cloudposse/iam-user/aws"
  version = "0.8.4"

  # backups-servers-us-west-1-jasons-home-nas-backups
  namespace   = "my-namespace"
  environment = "my-env"
  stage       = ""
  name        = "my-name"
  attributes  = []

  # Enable the IAM user
  enabled               = local.enabled
  login_profile_enabled = false
  user_name             = "jason"
}
