terraform {
  required_version {
      source  = "hashicorp/aws"
      version = " ~> 0.12 "
}
}
provider "aws_vpc" {
    region = var.region
}

resource "aws_vpc" "hal-logia-vpc" {
   cidr_block   = var.vpc_cidr
   instance_tenancy  = var.tenancy
   tags   {
      Name    = var.vpc-tag
 }
}

resource "aws_subnet" "hal-logia-subnet" {
   vpc_ic       = "${var.vpc_id}"
   cidr_block   = "${var.subnet_cidr}"
   tags   {
      Name    = var.vpc-tag
 }
}