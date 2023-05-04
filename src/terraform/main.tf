## AWS

# module "terraform_aws_jason_console_read_only_access" {
#   source  = "./terraform_aws_jason_console_read_only_access"
#   enabled = var.enabled

#   namespace = var.namespace
# }

module "aws_jason_console_read_only_access" {
  source  = "cloudposse/iam-user/aws"
  version = "0.8.4"

  namespace   = var.namespace
  environment = var.environment
  stage       = var.stage
  name        = "jason-console-read-only-access"
  attributes  = var.attributes

  # Enable the IAM user
  enabled               = var.aws_console_iam_user_enabled
  login_profile_enabled = false
  user_name             = var.user_name
  pgp_key               = ""
}

## Cloudflare

## DigitalOcean

## GitHub

# module "terraform_github_jason_riddle_infrastructure" {
#   source  = "./terraform_github_jason_riddle_infrastructure"
#   enabled = var.enabled
# }
