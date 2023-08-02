variable "region"  { default = "ap-northeast-3" }
variable "vpc_cidr" { default = "10.13.0.0/27"}
variable "tenancy"  {  default = "dedicated"  }
variable  "vpc_id " {}
variable "subnet_cidr" { default = "10.13.1.0/29"}
variable "vpc-tag" {
    default = "hal-logia-vpc"  
}