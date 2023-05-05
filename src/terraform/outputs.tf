# output "user_name" {
#   description = "jason user name"
#   value       = module.aws_console_iam_user.user_name
#   # value       = module.aws_console_iam_user.*.user_name
# }

output "terraform_infrastructure_aws_ci_user_name" {
  value = module.terraform_infrastructure_aws_ci_user.user_name
}
