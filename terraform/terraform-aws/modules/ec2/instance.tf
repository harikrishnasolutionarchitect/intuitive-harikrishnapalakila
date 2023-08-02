resource "aws_instance" "hal-logia-dev-linux-server" {
   count           = "${var.ec2_instance_count}"
   ami             = "${var.aws_ami_id}"
   instance_type   = "${var.ec2_instance_type}"
   subnet_id       = "${var.subnet_id}"
   iam_instance_profile = "${aws_iam_instance_profile.hal-logia-dev_instance_profile.id}"
   tags    {  Name  = var.servername  }
}
resource "aws_ebs_volume" "ebs_volume" {
  count             = "${var.ec2_instance_count * var.ec2_ebs_volume_count}"
  size              = "${var.ec2_ebs_volume_size}"
  availability_zone = "${element(aws_instance.ec2.*.availability_zone, count.index)}"
}
resource "aws_volume_attachment" "volume_attachement" {
  count       = "${var.ec2_instance_count * var.ec2_ebs_volume_count}"
  instance_id = "${element(aws_instance.ec2.*.id, count.index)}"
  volume_id   = "${aws_ebs_volume.ebs_volume.*.id[count.index]}"
  device_name = "${element(var.ec2_device_names, count.index)}"
}
resource "aws_iam_role" "hal-logia-dev_iam_role" {
    name = var.iam_role
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
resource "aws_iam_instance_profile" "hal-logia-dev_instance_profile" {
    name = var.iam_instance_profile
    roles = ["hal-logia-dev_iam_role"]
}

resource "aws_iam_role_policy" "hal-logia-dev_iam_role_policy" {
  name = var.iam_role_pocliy
  role = "${aws_iam_role.hal-logia-dev_iam_role.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:ListBucket"],
      "Resource": ["arn:aws:s3:::bucket-name"]
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "s3:DeleteObject"
      ],
      "Resource": ["arn:aws:s3:::bucket-name/*"]
    }
  ]
}
EOF
}
