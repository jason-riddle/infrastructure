# remote_backups_website_jasonriddlecom_updraftplus_backups

output "remote_backups_website_jasonriddlecom_updraftplus_backups_bucket_id" {
  value = module.remote_backups_website_jasonriddlecom_updraftplus_backups.bucket_id
}

output "remote_backups_website_jasonriddlecom_updraftplus_backups_access_key_id" {
  sensitive   = true
  value       = try(coalesce(module.remote_backups_website_jasonriddlecom_updraftplus_backups.access_key_id), "")
  description = "Access Key ID"
}

output "remote_backups_website_jasonriddlecom_updraftplus_backups_secret_access_key" {
  sensitive   = true
  value       = try(coalesce(module.remote_backups_website_jasonriddlecom_updraftplus_backups.secret_access_key), "")
  description = "Secret Access Key. This will be written to the state file in plain-text"
}
