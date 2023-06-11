# data "tfe_organization" "jasonriddle" {
#   name = "org-jasonriddle"
# }

# resource "tfe_workspace" "terraform_infrastructure" {
#   name         = "terraform-infrastructure"
#   organization = data.tfe_organization.jasonriddle.name
# }

# data "tfe_workspace" "terraform_infrastructure" {
#   name         = "terraform-infrastructure"
#   organization = data.tfe_organization.jasonriddle.name
# }

data "tfe_workspace" "terraform_infrastructure" {
  name         = "terraform-infrastructure"
  organization = "org-jasonriddle"
}

# TODO: Couldn't create env variable AWS_REGION_: resource not found
# resource "tfe_variable" "aws_region" {
#   key          = "AWS_REGION_"
#   value        = "us-west-1"
#   category     = "terraform"
#   workspace_id = data.tfe_workspace.terraform_infrastructure.id
# }
