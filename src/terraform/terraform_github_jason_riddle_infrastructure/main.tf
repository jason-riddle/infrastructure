data "github_repository" "jason_riddle_infrastructure" {
  full_name = "jason-riddle/infrastructure"
}

resource "github_branch_protection" "jason_riddle_infrastructure" {
  repository_id = data.github_repository.jason_riddle_infrastructure.node_id
  pattern       = "main"
}
