provider "aws" {
  region = "ap-northeast-2"
}

# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical
# }


# data "aws_ami" "al2023" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["al2023-ami-2023.1.20230629.0-kernel-6.1-x86_64"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["137112412989"] # Canonical
# }


# resource "aws_instance" "web" {
#   # ami           = data.aws_ami.ubuntu.id
#   ami                  = data.aws_ami.al2023.id
#   instance_type        = "t3.micro"
#   iam_instance_profile = "instance_profile"
#   vpc_security_group_ids = [aws_security_group.allow_8080.id]

#   tags = {
#     Name = "HelloWorld"
#   }
# }

# resource "aws_iam_role" "instance_role" {
#   name = "instance_role"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Sid    = ""
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       },
#     ]
#   })
#   managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]
# }

# resource "aws_iam_instance_profile" "instance_profile" {
#   name = "instance_profile"
#   role = aws_iam_role.instance_role.name
# }

# resource "aws_security_group" "allow_8080" {
#   name        = "allow_8080"
#   description = "Allow 8080 inbound traffic"
#   vpc_id      = data.aws_vpc.main.id

#   ingress {
#     description      = "TCP from Anywhere"
#     from_port        = 8080
#     to_port          = 8080
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "allow_8080"
#   }
# }

# data "aws_vpc" "main" {
#   id = "vpc-0ed99716d0f1dc929"
# }

# resource "aws_s3_bucket" "example" {
#   bucket = "my-tf-test-bucket-sean"

#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
# }
