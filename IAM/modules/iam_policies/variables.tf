variable "policies" {
  description = "IAM policies to be created"
  type = list(object({
    name        = string
    path        = optional(string, "/")
    description = optional(string)
    policy      = string
    tags        = optional(map(string), {})
  }))
  default = []
}