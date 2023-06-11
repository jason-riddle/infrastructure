## Label

module "label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"
  enabled = true

  namespace   = var.namespace
  environment = var.environment
  stage       = var.stage
}

## AWS

## Cloudflare

# DOCS: https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs

# jasonriddle.com
data "cloudflare_zone" "jasonriddle_com" {
  name = "jasonriddle.com"
}

# jasonriddle.com
module "cloudflare_zone_jasonriddle_com" {
  source  = "cloudposse/zone/cloudflare"
  version = "0.5.0"
  enabled = true

  account_id   = "7880ee87feea1839fb5a815cc479b080"
  zone         = "jasonriddle.com"
  zone_enabled = false

  records = [
    # Google Site Verification
    {
      name    = "jasonriddle.com"
      value   = "google-site-verification=bl5rOxJb15yoC3-RP291bMktkMzrZrrKDLyFvAEXaMs"
      type    = "TXT"
      ttl     = 1
      proxied = false
    },
    # jasonriddle.com
    {
      name    = "jasonriddle.com"
      value   = "185.212.71.169"
      type    = "A"
      ttl     = 1
      proxied = true
    },
    # newsletter.jasonriddle.com
    {
      name    = "newsletter"
      value   = "target.substack-custom-domains.com"
      type    = "CNAME"
      ttl     = 1
      proxied = false
    },
    # social.jasonriddle.com
    {
      name    = "social"
      value   = "vip.masto.host"
      type    = "CNAME"
      ttl     = 1
      proxied = false
    },
    # store.jasonriddle.com
    {
      name    = "store"
      value   = "domains.gumroad.com"
      type    = "CNAME"
      ttl     = 1
      proxied = false
    },
    # www.jasonriddle.com
    {
      name    = "www"
      value   = "185.212.71.169"
      type    = "A"
      ttl     = 1
      proxied = true
    },
    # Fastmail
    # Allows you to receive email at standard addresses, e.g. user@jasonriddle.com
    {
      name     = "jasonriddle.com"
      value    = "in1-smtp.messagingengine.com"
      type     = "MX"
      priority = 10
      ttl      = 1
      proxied  = false
    },
    # Fastmail
    # Allows you to receive email at standard addresses, e.g. user@jasonriddle.com
    # {
    #   name     = "jasonriddle.com"
    #   value    = "in2-smtp.messagingengine.com"
    #   type     = "MX"
    #   priority = 20
    #   ttl      = 1
    #   proxied  = false
    # },
    # TODO: Not able to add these recods due to duplicate error key
    # SEE: https://github.com/jason-riddle/infrastructure/actions/runs/5042180187/jobs/9042553889#step:10:56
    # Fastmail
    # Allows you to receive email at subdomain addresses, e.g. foo@user.jasonriddle.com
    {
      name     = "*"
      value    = "in1-smtp.messagingengine.com"
      type     = "MX"
      priority = 10
      ttl      = 1
      proxied  = false
    },
    # Fastmail
    # Allows you to receive email at subdomain addresses, e.g. foo@user.jasonriddle.com
    # {
    #   name     = "*"
    #   value    = "in2-smtp.messagingengine.com"
    #   type     = "MX"
    #   priority = 20
    #   ttl      = 1
    #   proxied  = false
    # }
  ]

  context = module.label.context
}

# Fastmail
# Allows you to receive email at standard addresses, e.g. user@jasonriddle.com
resource "cloudflare_record" "jasonriddle_com_10_in2-smtp_messagingengine_com" {
  count = 1

  zone_id  = data.cloudflare_zone.jasonriddle_com.id
  name     = "jasonriddle.com"
  value    = "in2-smtp.messagingengine.com"
  type     = "MX"
  priority = 20
  ttl      = 1
  proxied  = false

  lifecycle {
    prevent_destroy = true
  }
}

# Fastmail
# Allows you to receive email at subdomain addresses, e.g. foo@user.jasonriddle.com
resource "cloudflare_record" "wildcard_jasonriddle_com_20_in1-smtp_messagingengine_com" {
  count = 1

  zone_id  = data.cloudflare_zone.jasonriddle_com.id
  name     = "*"
  value    = "in2-smtp.messagingengine.com"
  type     = "MX"
  priority = 20
  ttl      = 1
  proxied  = false

  lifecycle {
    prevent_destroy = true
  }
}

# jrapps.org
module "cloudflare_zone_jrapps_org" {
  source  = "cloudposse/zone/cloudflare"
  version = "0.5.0"
  enabled = true

  account_id   = "7880ee87feea1839fb5a815cc479b080"
  zone         = "jrapps.org"
  zone_enabled = false
  records = [
    # nextcloud.jrapps.org
    {
      name    = "nextcloud"
      value   = "nx15310.your-storageshare.de"
      type    = "CNAME"
      ttl     = 1
      proxied = false
    }
  ]

  context = module.label.context
}

## DigitalOcean

## GitHub

data "github_repository" "infrastructure" {
  full_name = "jason-riddle/infrastructure"
}

resource "github_branch_protection" "infrastructure" {
  count = 1

  repository_id = data.github_repository.infrastructure.node_id

  pattern                 = "main"
  allows_deletions        = false
  required_linear_history = true

  required_status_checks {
    strict = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

## Google

## HCP

## Tailscale

## Terraform Cloud/Enterprise

## Twilio

## Vault
