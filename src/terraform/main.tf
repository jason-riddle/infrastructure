module "terraform_aws_jason_console_read_only_access" {
  source  = "./terraform_aws_jason_console_read_only_access"
  enabled = var.enabled

  namespace = var.namespace
}

module "terraform_github_jason_riddle_infrastructure" {
  source  = "./terraform_github_jason_riddle_infrastructure"
  enabled = var.enabled
}
