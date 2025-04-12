variable "roles" {
  description = "IAM roles to be created"
  type = list(object({
    name                 = string
    path                 = optional(string, "/")
    assume_role_policy   = string
    description          = optional(string)
    max_session_duration = optional(number, 3600)
    permissions_boundary = optional(string)
    policy_attachments   = optional(list(string), [])
    inline_policies      = optional(map(string), {})
    tags                 = optional(map(string), {})
  }))
  default = []
}