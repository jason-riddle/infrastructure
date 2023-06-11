data "tfe_organization" "jasonriddle" {
  name = "org-jasonriddle"
}

data "tfe_workspace" "terraform_infrastructure" {
  name         = "terraform-infrastructure"
  organization = tfe_organization.jasonriddle.name
}

resource "tfe_variable" "foo_bar" {
  key          = "FOO"
  value        = "BAR"
  category     = "env"
  workspace_id = tfe_workspace.terraform_infrastructure.id
}
