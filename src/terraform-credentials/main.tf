data "tfe_organization" "jasonriddle" {
  name = "org-jasonriddle"
}

data "tfe_workspace" "terraform_infrastructure" {
  name         = "terraform-infrastructure"
  organization = data.tfe_organization.jasonriddle.name
}

## AWS

resource "tfe_variable" "aws_region" {
  key          = "AWS_REGION"
  value        = "us-west-1"
  category     = "env"
  workspace_id = data.tfe_workspace.terraform_infrastructure.id
}
