provider "azure" { 
    region = var.region 
}
  
module "hal-logia-vnet" {
    source          = "../../virtual_machine"
    vpc_cidr        = var.region
    tenancy         = var.tenancy
    vpc_id          = var.vpc_id
    subnet_cidr     = var.subnet_cidr
}
module "hal-logia-dev-Linux-server" {
    source                   = "../../virtual_machine"
    ec2_instance_count       = var.ec2_instance_count
    ami                      = var.ami
    instance_type            = var.instance_type
    subnet_id                = var.subnet_id
}
module "hal-logia-dev-sa" {
  source               = "../../storage_account"
  bucket               = var.bucket_name
  acl                  = var.acl
  bucket_prefix        = var.bucket_prefix
  force_destroy        = var.force_destroy
  object_lock_enabled  = var.object_lock_enabled 
  tags                 = var.s3_tags
  versioning {
            enabled = true
    } 
}