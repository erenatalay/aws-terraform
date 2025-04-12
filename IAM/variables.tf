variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS CLI profile"
  type        = string
  default     = "default"
}

variable "default_tags" {
  description = "Default tags to be added to all resources"
  type        = map(string)
  default     = {
    Environment = "Development"
    ManagedBy   = "Terraform"
    Project     = "IAM-Management"
  }
}

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

variable "groups" {
  description = "IAM groups to be created"
  type = list(object({
    name               = string
    path               = optional(string, "/")
    policy_attachments = optional(list(string), [])
  }))
  default = []
}

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
