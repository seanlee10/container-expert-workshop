# terraform {
#   backend "remote" {
#     hostname     = "app.terraform.io"
#     organization = "lguplus-aws-demo"

#     workspaces {
#       prefix = "aws-iac-workload-"
#     }
#   }
#   required_version = ">= 1.0.1"
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "4.54.0"
#     }
#   }
# }

provider "aws" {
  region = "ap-northeast-2"
}