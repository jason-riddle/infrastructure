# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record
# https://dash.cloudflare.com/7880ee87feea1839fb5a815cc479b080/jasonriddle.com/dns/records

data "cloudflare_zone" "jasonriddlecom" {
  name = "jasonriddle.com"
}

# Root level
# jasonriddle.com > 185.212.71.169
resource "cloudflare_record" "jasonriddle_com" {
  zone_id = data.cloudflare_zone.jasonriddlecom.id
  name    = "jasonriddle.com"
  value   = "185.212.71.169"
  comment = "Root Wordpress"
  type    = "A"
  ttl     = 1
  proxied = true
}

# www subdomain
# www.jasonriddle.com > 185.212.71.169
resource "cloudflare_record" "www_jasonriddle_com" {
  zone_id = data.cloudflare_zone.jasonriddlecom.id
  name    = "www"
  value   = "185.212.71.169"
  comment = "Wordpress www subdomain redirect"
  type    = "A"
  ttl     = 1
  proxied = true
}

# Fastmail
# Allows you to receive email at standard addresses, e.g. user@jasonriddle.com
resource "cloudflare_record" "jasonriddle_com_10_in1-smtp_messagingengine_com" {
  zone_id  = data.cloudflare_zone.jasonriddlecom.id
  name     = "jasonriddle.com"
  value    = "in1-smtp.messagingengine.com"
  comment  = "Allows you to receive email at standard addresses"
  type     = "MX"
  priority = 10
  ttl      = 1
  proxied  = false
}

# Fastmail
# Allows you to receive email at standard addresses, e.g. user@jasonriddle.com
resource "cloudflare_record" "jasonriddle_com_10_in2-smtp_messagingengine_com" {
  zone_id  = data.cloudflare_zone.jasonriddlecom.id
  name     = "jasonriddle.com"
  value    = "in2-smtp.messagingengine.com"
  comment  = "Allows you to receive email at standard addresses"
  type     = "MX"
  priority = 20
  ttl      = 1
  proxied  = false
}

# Fastmail
# Allows you to receive email at subdomain addresses, e.g. foo@user.jasonriddle.com
resource "cloudflare_record" "wildcard_jasonriddle_com_10_in1-smtp_messagingengine_com" {
  zone_id  = data.cloudflare_zone.jasonriddlecom.id
  name     = "*.jasonriddle.com"
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
  zone_id  = data.cloudflare_zone.jasonriddlecom.id
  name     = "*.jasonriddle.com"
  value    = "in2-smtp.messagingengine.com"
  comment  = "Allows you to receive email at subdomain addresses"
  type     = "MX"
  priority = 20
  ttl      = 1
  proxied  = false
}

# txt subdomain for google site verification for google search console and google analytics verification
# resource "cloudflare_record" "google_site_verification" {
#   zone_id = data.cloudflare_zone.jasonriddlecom.id
#   name    = "jasonriddle.com"
#   value   = "google-site-verification=bl5rOxJb15yoC3-RP291bMktkMzrZrrKDLyFvAEXaMs"
#   comment = ""
#   type    = "TXT"
#   ttl     = 1
#   proxied = false
# }
