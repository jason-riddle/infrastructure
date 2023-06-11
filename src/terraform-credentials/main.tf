data "tfe_organization" "jasonriddle" {
  name = "org-jasonriddle"
}

data "tfe_workspace" "terraform_infrastructure" {
  name         = "terraform-infrastructure"
  organization = data.tfe_organization.jasonriddle.name
}

## AWS

resource "tfe_variable" "aws_access_key_id" {
  key          = "FAKE_AWS_ACCESS_KEY_ID"
  value        = ""
  category     = "env"
  sensitive    = true
  workspace_id = data.tfe_workspace.terraform_infrastructure.id
}

resource "tfe_variable" "aws_region" {
  key          = "AWS_REGION"
  value        = "us-west-1"
  category     = "env"
  workspace_id = data.tfe_workspace.terraform_infrastructure.id
}

resource "tfe_variable" "aws_secret_access_key" {
  key          = "FAKE_AWS_SECRET_ACCESS_KEY"
  value        = ""
  category     = "env"
  sensitive    = true
  workspace_id = data.tfe_workspace.terraform_infrastructure.id
}
