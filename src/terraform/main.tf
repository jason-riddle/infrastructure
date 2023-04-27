module "terraform_aws_console_jason_read_only_access" {
  source  = "./terraform_aws_console_jason_read_only_access"
  enabled = var.enabled
}

module "terraform_github_jason_riddle_infrastructure" {
  source  = "./terraform_github_jason_riddle_infrastructure"
  enabled = var.enabled
}
