variable "region" {
  default = "ap-northeast-2"
}

variable "vpc_cidr" {
  default = "192.168.0.0/24"
}
variable "tenancy" {
  default = "default"
}
variable "vpc_id" {
  default = "${module.hal-logia-dev_vpc.vpc_id}"
}
variable "subnet_cidr" {
  default =  "192.168.1.0/24"
}
variable "ec2_instance_count" {
  default = "2"
}
variable "ami" {
  default = "ami-12345"
}
variable "instance_type" {
  default = "m4.xlarge"
}
variable "subnet_id" {
  default = "${module.hal-logia-dev_vpc.subnet_id}"
}

variable "bucket_name" {
    default = "api-01"
}
variable "acl" {
    default = "priviate"
}
variable "bucket_prefix" {
    default = "hal-logia-dev-"
}
variable "force_destroy" {
    default = "false"
}
variable "object_lock_enabled" {
    default = "True"
}
variable "s3_tags" {
    default = "dev"
}