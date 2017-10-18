provider "aws" {
  region = "us-east-2"
}

data "aws_ami" "workshop_ami" {
  most_recent = true

  filter {
    name   = "owner-id"
    values = ["602636675831"]
  }

  filter {
    name   = "name"
    values = ["beevalabs-workshop2017-*"]
  }
}

resource "aws_vpc" "workshop_vpc" {
  cidr_block           = "10.20.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_subnet" "workshop_subnet" {
  vpc_id                  = "${aws_vpc.workshop_vpc.id}"
  cidr_block              = "10.20.0.0/16"
  map_public_ip_on_launch = true
}

resource "aws_security_group" "workshop_sg" {
  vpc_id      = "${aws_vpc.workshop_vpc.id}"
  name        = "workshop_sg"
  description = "workshop_sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.workshop_vpc.id}"
}

resource "aws_route" "r" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = "${aws_vpc.workshop_vpc.default_route_table_id}"
  gateway_id             = "${aws_internet_gateway.gw.id}"
}

# resource "aws_iam_role" "mapd_sample_data_ro_role" {
#   name = "s3_readonly_role"

#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": {
#     "Effect": "Allow",
#     "Principal": {"Service": "ec2.amazonaws.com"},
#     "Action": "sts:AssumeRole"
#   }
# }
# EOF
# }

# resource "aws_iam_policy" "mapd_sample_data_ro_policy" {
#   name        = "mapd_sample_data_ro_profile"
#   description = "mapd_sample_data_ro_profile"

#   policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": [
#         "s3:Get*",
#         "s3:List*"
#       ],
#       "Effect": "Allow",
#       "Resource": "arn:aws:s3:::awssampledbuswest2"
#     }
#   ]
# }
# EOF
# }

# resource "aws_iam_role_policy_attachment" "test-attach" {
#   role       = "${aws_iam_role.mapd_sample_data_ro_role.name}"
#   policy_arn = "${aws_iam_policy.mapd_sample_data_ro_policy.arn}"
# }

# resource "aws_iam_instance_profile" "mapd_sample_data_ro_profile" {
#   name = "mapd_sample_data_ro_profile"
#   role = "${aws_iam_role.mapd_sample_data_ro_role.name}"
# }

resource "aws_instance" "workshop_server" {
  ami           = "${data.aws_ami.workshop_ami.image_id}"
  instance_type = "p2.xlarge"
  subnet_id     = "${aws_subnet.workshop_subnet.id}"

  #  iam_instance_profile = "${aws_iam_instance_profile.mapd_sample_data_ro_profile.id}"
  key_name = "mrc"
  count    = 1

  vpc_security_group_ids = [
    "${aws_vpc.workshop_vpc.default_security_group_id}",
    "${aws_security_group.workshop_sg.id}",
  ]

  root_block_device = {
    volume_size = 100
  }
}
