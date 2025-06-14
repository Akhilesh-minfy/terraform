terraform {
  required_providers {
    aws={
         source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "day-02-akhilesh-backend"
    key = "terraform-backend/terraform.tfstate"
    region= "ap-south-1"
  }
}
provider "aws" {
  region = var.aws_region
}