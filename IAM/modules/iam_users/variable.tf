variable "users" {
  description = "IAM users to be created"
  type = list(object({
    name                 = string
    path                 = optional(string, "/")
    permissions_boundary = optional(string)
    force_destroy        = optional(bool, false)
    create_login_profile = optional(bool, false)
    password             = optional(string)
    password_reset       = optional(bool, true)
    group_memberships    = optional(list(string), [])
    policy_attachments   = optional(list(string), [])
    tags                 = optional(map(string), {})
  }))
  default = []
}

