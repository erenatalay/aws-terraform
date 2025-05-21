variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-west-1"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "my-project"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "buckets" {
  description = "Map of S3 buckets to create"
  type = map(object({
    enable_versioning = bool
    enable_encryption = bool
    lifecycle_rules   = list(object({
      id      = string
      status  = string
      transitions = optional(list(object({
        days          = number
        storage_class = string
      })), [])
      expiration = optional(object({
        days = number
      }))
    }))
  }))
  default = {}
}