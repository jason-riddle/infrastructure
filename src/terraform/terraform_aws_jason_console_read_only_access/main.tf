# locals {
#   enabled = var.enabled
# }

# # WIP: Enable login profile and fill in namespace, environment, etc.
# module "aws_jason_console_read_only_access" {
#   source  = "cloudposse/iam-user/aws"
#   version = "0.8.4"

#   namespace   = var.namespace
#   environment = var.environment
#   stage       = var.stage
#   name        = var.name
#   attributes  = var.attributes

#   # Enable the IAM user
#   enabled               = local.enabled
#   login_profile_enabled = false
#   user_name             = var.user_name
#   pgp_key               = ""
# }
