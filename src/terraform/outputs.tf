## AWS

# output "aws_iam_user_jason_user_name" {
#   value = module.aws_iam_user_jason.user_name
# }

output "aws_iam_system_user_access_key_id" {
  value     = module.aws_iam_system_user.access_key_id
  sensitive = true
}

output "aws_iam_system_user_secret_access_key" {
  value     = module.aws_iam_system_user.secret_access_key
  sensitive = true
}

## Cloudflare

## DigitalOcean

# output "kube_config" {
#   value     = digitalocean_kubernetes_cluster.k8s.*.kube_config
#   sensitive = true
# }

# output "k8s_cluster_name" {
#   value = digitalocean_kubernetes_cluster.k8s.*.name
# }

## GitHub

## HCP

output "hcp_vault_cluster_vault_cluster_id" {
  # value     = hcp_vault_cluster.vault[0]
  value     = hcp_vault_cluster.vault[0].cluster_id
  sensitive = false
}

## Tailscale

## Terraform Cloud/Enterprise

## Twilio
