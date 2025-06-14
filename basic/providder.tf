terraform {
  required_providers {
    aws = {
     source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
    backend "s3" {   
          bucket = "minfy-training-akhilesh-s3-1321"   
            key    = "terraform.tfstate" 
            region = "ap-south-1"  
   } 
}
 

provider "aws" {
    region ="ap-south-1"
    profile = "AdminAccess-835456546890"
}
resource "aws_s3_bucket" "my_buckett" {
  bucket = "minfy-training-akhilesh-s3-1321"

  tags = {
    Name  = "day-two-akhilesh-bucket"
  }
}