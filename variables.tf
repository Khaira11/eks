variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "Eks-cluster"
  type        = string
  default     = "beginner-eks-cluster"
}