# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/api_token
# https://dash.cloudflare.com/profile/api-tokens

// Template - Create Additional Tokens
// Requires 'All users - API Tokens:Edit'

data "cloudflare_api_token_permission_groups" "all" {}

resource "cloudflare_api_token" "tf_zone_token" {
  name = "tf_zone_token"

  policy {
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.permissions["Zone Read"],
      data.cloudflare_api_token_permission_groups.all.permissions["DNS Write"]
    ]
    resources = {
      "com.cloudflare.api.account.zone.9f93875a5fa04d2c57407aac00a18ce9" = "*"
    }
  }
}

resource "cloudflare_api_token" "tf_account_token" {
  name = "tf_account_token"

  policy {
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.account["Logs Write"],
    ]
    resources = {
      "com.cloudflare.api.account.7880ee87feea1839fb5a815cc479b080" = "*"
    }
  }
}
