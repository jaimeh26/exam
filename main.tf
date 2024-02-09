terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./vpc_module"
}

module "ec2_instance" {
  source   = "./ec2_instance_module"
  vpc_id   = module.vpc.vpc_id
  subnet_id = module.vpc.subnet_id
}
