terraform {
backend "s3" {
bucket = "harpreet-terraform-state-001"
key    = "eks/terraform.tfstate"
region = "us-east-1"
}
}

provider "aws" {
region = var.aws_region
}
