variable "groups" {
  description = "IAM groups to be created"
  type = list(object({
    name               = string
    path               = optional(string, "/")
    policy_attachments = optional(list(string), [])
  }))
  default = []
}

