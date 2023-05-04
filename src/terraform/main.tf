## AWS

# module "terraform_aws_jason_console_read_only_access" {
#   source  = "./terraform_aws_jason_console_read_only_access"
#   enabled = var.enabled

#   namespace = var.namespace
# }

# module "aws_console_iam_user" {
#   source  = "cloudposse/iam-user/aws"
#   version = "0.8.4"

#   namespace   = var.namespace
#   environment = var.environment
#   stage       = var.stage
#   name        = "aws-console-iam-user-jason"
#   attributes  = var.attributes

#   # Enable the IAM user
#   enabled               = var.aws_console_iam_user_enabled
#   login_profile_enabled = false
#   user_name             = "jason"
#   pgp_key               = ""
# }

module "terraform_infrastructure_ci_user" {
  source  = "cloudposse/iam-system-user/aws"
  version = "1.1.0"
}

## Cloudflare

## DigitalOcean

## GitHub

# module "terraform_github_jason_riddle_infrastructure" {
#   source  = "./terraform_github_jason_riddle_infrastructure"
#   enabled = var.enabled
# }
