variable "enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources"
}

variable "namespace" {
  type        = string
  default     = "test-jr"
  description = "ID element. Usually an abbreviation of your organization name, e.g. 'eg' or 'cp', to help ensure generated IDs are globally unique"
}

# variable "environment" {
#   type        = string
#   default     = "test-infrastructure"
#   description = "ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT'"
# }

# variable "stage" {
#   type        = string
#   default     = "testing"
#   description = "ID element. Usually used to indicate role, e.g. 'prod', 'staging', 'source', 'build', 'test', 'deploy', 'release'"
# }

# variable "name" {
#   type        = string
#   default     = null
#   description = <<-EOT
#     ID element. Usually the component or solution name, e.g. 'app' or 'jenkins'.
#     This is the only ID element not also included as a `tag`.
#     The "name" tag is set to the full `id` string. There is no tag with the value of the `name` input.
#     EOT
# }

# variable "attributes" {
#   type        = list(string)
#   default     = []
#   description = <<-EOT
#     ID element. Additional attributes (e.g. `workers` or `cluster`) to add to `id`,
#     in the order they appear in the list. New attributes are appended to the
#     end of the list. The elements of the list are joined by the `delimiter`
#     and treated as a single ID element.
#     EOT
# }
