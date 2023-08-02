provider "aws" { 
    region = var.region 
}
  
module "hal-logia-dev_vpc" {
    source          = "../../../../modules/vpc"
    vpc_cidr        = var.region
    tenancy         = var.tenancy
    vpc_id          = var.vpc_id
    subnet_cidr     = var.subnet_cidr
}
module "hal-logia-dev_Linux_server" {
    source                   = "../../../../modules/ec2"
    ec2_instance_count       = var.ec2_instance_count
    ami                      = var.ami
    instance_type            = var.instance_type
    subnet_id                = var.subnet_id
}
module "hal-logia-dev-s3-bucket" {
  source               = "../../../../modules/s3"
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