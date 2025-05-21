output "s3_bucket_ids" {
  description = "IDs of the created S3 buckets"
  value = {
    for bucket_key, bucket in module.s3_buckets : 
      bucket_key => bucket.bucket_id
  }
}

output "s3_bucket_arns" {
  description = "ARNs of the created S3 buckets"
  value = {
    for bucket_key, bucket in module.s3_buckets : 
      bucket_key => bucket.bucket_arn
  }
}

output "s3_bucket_domain_names" {
  description = "Domain names of the created S3 buckets"
  value = {
    for bucket_key, bucket in module.s3_buckets : 
      bucket_key => bucket.bucket_domain_name
  }
}