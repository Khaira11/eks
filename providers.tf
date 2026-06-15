terraform {
  backend "s3" {
    bucket = "harpreet-terraform-state-001"
    key    = "eks/terraform.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = "ap-south-1"
}
