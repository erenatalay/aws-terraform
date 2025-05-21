locals {
  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

module "s3_buckets" {
  source = "./modules/s3_bucket"
  
  for_each = var.buckets
  
  bucket_name       = "${var.project_name}-${each.key}-${var.environment}"
  environment       = var.environment
  enable_versioning = each.value.enable_versioning
  enable_encryption = each.value.enable_encryption
  lifecycle_rules   = each.value.lifecycle_rules
  
  tags = local.tags
}