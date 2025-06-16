#AWS Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.99.1"
    }
  }
}

provider "aws" {
  region  = "eu-central-1" # also defined in ../ansible/get_ec2_inventory.yml
  profile = "default"
}
