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

# module "terraform_infrastructure_aws_ci_user" {
#   source  = "cloudposse/iam-system-user/aws"
#   version = "1.1.0"
#   enabled = true

#   namespace   = var.namespace
#   environment = var.environment
#   stage       = var.stage
#   name        = "aws-ci-user"

#   ssm_enabled                   = false
#   ssm_ses_smtp_password_enabled = false
# }

## Cloudflare

# DOCS: https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs

# jasonriddle.com
data "cloudflare_zone" "jasonriddlecom" {
  name = "jasonriddle.com"
}

# Google Site Verification
resource "cloudflare_record" "google_site_verification" {
  zone_id = data.cloudflare_zone.jasonriddlecom.id
  name    = "jasonriddle.com"
  value   = "google-site-verification=bl5rOxJb15yoC3-RP291bMktkMzrZrrKDLyFvAEXaMs"
  comment = ""
  type    = "TXT"
  ttl     = 1
  proxied = false
}

# jrapps.org
data "cloudflare_zone" "jrappsorg" {
  name = "jrapps.org"
}

## DigitalOcean

## GitHub

# module "terraform_github_jason_riddle_infrastructure" {
#   source  = "./terraform_github_jason_riddle_infrastructure"
#   enabled = var.enabled
# }
