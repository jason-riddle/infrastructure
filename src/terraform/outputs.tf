## AWS

# output "aws_iam_user_jason_user_name" {
#   value = module.aws_iam_user_jason.user_name
# }

## Cloudflare

## DigitalOcean

output "kube_config" {
  value = digitalocean_kubernetes_cluster.k8s.*.kube_config
}

## GitHub

## HCP

## Tailscale

## Terraform Cloud/Enterprise

## Twilio
