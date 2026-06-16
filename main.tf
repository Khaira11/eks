# Filter out available Availability Zones
data "aws_availability_zones" "available" {}

# 1. Create a Virtual Private Cloud (VPC) for the EKS Cluster
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "eks-vpc"
  cidr = "10.0.0.0/16"

  azs             = slice(data.aws_availability_zones.available.names, 0, 3)
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true # Keeps costs lower for beginners

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }
}

# 2. Create the EKS Cluster
module "eks" {
cluster_name = "beginner-eks-cluster"

eks_managed_node_groups = {
default = {
min_size     = 1
max_size     = 1
desired_size = 1

```
  instance_types = ["t3.micro"]
}
```

}
}


  
}