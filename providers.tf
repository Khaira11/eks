terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  # Keeps your state file safe in an S3 bucket
  backend "s3" {
    bucket = "YOUR-UNIQUE-TERRAFORM-STATE-BUCKET" # Change this!
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}