module "terraform_aws_130659808697_Jason_Riddle" {
  source  = "cloudposse/iam-user/aws"
  version = "0.8.4"

  # backups-servers-us-west-1-jasons-home-nas-backups
  namespace   = "my-namespace"
  environment = "my-env"
  stage       = ""
  name        = "my-name"
  attributes  = []

  # Enable the IAM user
  enabled               = true
  login_profile_enabled = false
  user_name             = "my_username"
  pgp_key               = "my_pgp_key"
}
