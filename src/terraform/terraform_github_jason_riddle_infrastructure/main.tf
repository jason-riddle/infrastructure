locals {
  enabled = var.enabled
}

data "github_repository" "jason_riddle_infrastructure" {
  full_name = "jason-riddle/infrastructure"
}

resource "github_branch_protection" "jason_riddle_infrastructure" {
  count         = local.enabled ? 1 : 0
  repository_id = data.github_repository.jason_riddle_infrastructure.node_id
  pattern       = "main"
}
