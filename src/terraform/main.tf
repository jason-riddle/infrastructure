## AWS

module "aws_iam_user_jason" {
  source  = "cloudposse/iam-user/aws"
  version = "0.8.4"
  enabled = false

  namespace   = var.namespace
  environment = var.environment
  stage       = var.stage
  name        = "aws-iam-user-jason"

  login_profile_enabled = false
  user_name             = "jason"
  pgp_key               = ""
}

module "aws_iam_system_user_terraform_cloud" {
  source  = "cloudposse/iam-system-user/aws"
  version = "1.1.0"
  enabled = false

  namespace   = var.namespace
  environment = var.environment
  stage       = var.stage
  name        = "aws-iam-system-user-terraform-cloud"

  ssm_enabled                   = false
  ssm_ses_smtp_password_enabled = false
}

## Cloudflare

# DOCS: https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs

# jasonriddle.com
data "cloudflare_zone" "jasonriddle_com" {
  name = "jasonriddle.com"
}

# Google Site Verification
resource "cloudflare_record" "google_site_verification" {
  zone_id = data.cloudflare_zone.jasonriddle_com.id
  name    = "jasonriddle.com"
  value   = "google-site-verification=bl5rOxJb15yoC3-RP291bMktkMzrZrrKDLyFvAEXaMs"
  comment = ""
  type    = "TXT"
  ttl     = 1
  proxied = false
}

# jasonriddle.com
resource "cloudflare_record" "jasonriddle_com" {
  zone_id = data.cloudflare_zone.jasonriddle_com.id
  name    = "jasonriddle.com"
  value   = "185.212.71.169"
  comment = "Root Domain - WordPress"
  type    = "A"
  ttl     = 1
  proxied = true
}

# newsletter.jasonriddle.com
resource "cloudflare_record" "newsletter_jasonriddle_com" {
  zone_id = data.cloudflare_zone.jasonriddle_com.id
  name    = "newsletter"
  value   = "target.substack-custom-domains.com"
  comment = "Newsletter"
  type    = "CNAME"
  ttl     = 1
  proxied = false
}

# www.jasonriddle.com
resource "cloudflare_record" "www_jasonriddle_com" {
  zone_id = data.cloudflare_zone.jasonriddle_com.id
  name    = "www"
  value   = "185.212.71.169"
  comment = "WWW Subdomain - WordPress"
  type    = "A"
  ttl     = 1
  proxied = true
}

# Fastmail
# Allows you to receive email at standard addresses, e.g. user@jasonriddle.com
resource "cloudflare_record" "jasonriddle_com_10_in1-smtp_messagingengine_com" {
  zone_id  = data.cloudflare_zone.jasonriddle_com.id
  name     = "jasonriddle.com"
  value    = "in1-smtp.messagingengine.com"
  comment  = "Fastmail - Allows you to receive email at standard addresses"
  type     = "MX"
  priority = 10
  ttl      = 1
  proxied  = false
}

# Fastmail
# Allows you to receive email at standard addresses, e.g. user@jasonriddle.com
resource "cloudflare_record" "jasonriddle_com_10_in2-smtp_messagingengine_com" {
  zone_id  = data.cloudflare_zone.jasonriddle_com.id
  name     = "jasonriddle.com"
  value    = "in2-smtp.messagingengine.com"
  comment  = "Fastmail - Allows you to receive email at standard addresses"
  type     = "MX"
  priority = 20
  ttl      = 1
  proxied  = false
}

# Fastmail
# Allows you to receive email at subdomain addresses, e.g. foo@user.jasonriddle.com
resource "cloudflare_record" "wildcard_jasonriddle_com_10_in1-smtp_messagingengine_com" {
  zone_id  = data.cloudflare_zone.jasonriddle_com.id
  name     = "*"
  value    = "in1-smtp.messagingengine.com"
  comment  = "Allows you to receive email at subdomain addresses"
  type     = "MX"
  priority = 10
  ttl      = 1
  proxied  = false
}

# Fastmail
# Allows you to receive email at subdomain addresses, e.g. foo@user.jasonriddle.com
resource "cloudflare_record" "wildcard_jasonriddle_com_20_in1-smtp_messagingengine_com" {
  zone_id  = data.cloudflare_zone.jasonriddle_com.id
  name     = "*"
  value    = "in2-smtp.messagingengine.com"
  comment  = "Allows you to receive email at subdomain addresses"
  type     = "MX"
  priority = 20
  ttl      = 1
  proxied  = false
}

# jrapps.org
data "cloudflare_zone" "jrapps_org" {
  name = "jrapps.org"
}

# nextcloud.jrapps.org
resource "cloudflare_record" "jrapps_org_nx15310_your_storageshare_de" {
  zone_id = data.cloudflare_zone.jrapps_org.id
  name    = "nextcloud"
  value   = "nx15310.your-storageshare.de"
  comment = "Nextcloud"
  type    = "CNAME"
  ttl     = 1
  proxied = false
}

## DigitalOcean

resource "digitalocean_kubernetes_cluster" "jasons_k8s_cluster" {
  count = 0

  name    = "jasons-k8s-cluster"
  region  = "sfo3"
  version = "1.26.3-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = 1
  }
}

## GitHub

resource "github_repository" "example" {
  count = 0

  name               = "example"
  archive_on_destroy = false
}

resource "github_branch_protection" "example" {
  count = 0

  repository_id = github_repository.example.*.node_id
  pattern       = "main"
}

## Tailscale

## Terraform Cloud/Enterprise

## Twilio
