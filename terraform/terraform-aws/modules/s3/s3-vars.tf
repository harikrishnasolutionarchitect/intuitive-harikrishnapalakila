
variable  "bucket_name"   {       default  = "terraform-ce-bucket-01"  }
variable  "acl"           {       default  = "private"                 }
variable  "s3_tags"       {       default  = "terraform-ce-bucket-01"  }

variable "bucket_prefix" {
  description = "(Optional, Forces new resource) Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket."
  type        = string
  default     = null
}
variable "force_destroy" {
  description = "(Optional, Default:false ) A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
  type        = bool
  default     = false
}
variable "object_lock_configuration" {
  description = "Map containing S3 object locking configuration."
  type        = any
  default     = {}
}