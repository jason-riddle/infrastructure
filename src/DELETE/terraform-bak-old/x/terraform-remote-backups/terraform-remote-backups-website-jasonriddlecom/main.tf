# REF: https://github.com/cloudposse/terraform-aws-s3-bucket
# REF: https://registry.terraform.io/modules/cloudposse/s3-bucket/aws/latest
module "remote_backups_website_jasonriddlecom_updraftplus_backups" {
  source  = "cloudposse/s3-bucket/aws"
  version = "3.0.0"

  namespace   = "remote-backups-website"
  environment = "us-west-1"
  stage       = ""
  name        = "jasonriddlecom"
  attributes  = ["updraftplus", "backups"]

  # Enable the IAM user
  enabled            = true
  user_enabled       = true
  versioning_enabled = false
}
