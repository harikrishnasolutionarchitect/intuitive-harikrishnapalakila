resource "aws_s3_bucket" "terraform-ce-bucket" {
  bucket               = var.bucket_name
  acl                  = var.acl
  bucket_prefix        = var.bucket_prefix
  force_destroy        = var.force_destroy
  object_lock_enabled  = var.object_lock_enabled 
  versioning {
            enabled = true
    } 
  tags                 = var.s3_tags
}