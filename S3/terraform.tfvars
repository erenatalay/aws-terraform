aws_region   = "us-east-1"
buckets = {
  "data" = {
    enable_versioning = true
    enable_encryption = true
    lifecycle_rules   = [
      {
        id     = "archive-after-90-days"
        status = "Enabled"
        transitions = [
          {
            days          = 90
            storage_class = "STANDARD_IA"
          },
          {
            days          = 180
            storage_class = "GLACIER"
          }
        ]
      }
    ]
  },
  # "logs" = {
  #   enable_versioning = false
  #   enable_encryption = true
  #   lifecycle_rules   = [
  #     {
  #       id     = "delete-old-logs"
  #       status = "Enabled"
  #       expiration = {
  #         days = 90
  #       }
  #     }
  #   ]
  # },
  # "backups" = {
  #   enable_versioning = true
  #   enable_encryption = true
  #   lifecycle_rules   = []
  # }
}