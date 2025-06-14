variable "aws_region" {
    description= "aws region"
     type=string
     default="ap-south-1"  
}
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
variable "web_server_ami" {
  default = "ami-0b09627181c8d5778"
}