variable "ec2_instance_count"   {      default = 3                                      }
variable "aws_ami_id"           {      default = "ami-123456"                           }
variable "ec2_instance_type"    {      default = "m4.2xlarge"                           }
variable "subnet_id" {}
variable "ec2_ebs_volume_count" {      default = 3                                      }
variable "ec2_device_names"     {      default = [ "/dev/sdd", "/dev/sde", "/dev/sdf" ] }
variable "ec2_ebs_volume_size"  {      default = 150                                    }
variable "servername"           {      default = "hal-logia-dev"                        }
variable "iam_role"             {      default = "hal-logia-dev_iam_role"               }
variable "iam_instance_profile" {      default = "hal-logia-dev_instance_profile"       }
variable "iam_role_pocliy"      {      default = "hal-logia-dev_iam_role_policy"        }
variable "ssh_key"              {      }