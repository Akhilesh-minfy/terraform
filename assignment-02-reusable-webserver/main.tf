resource "aws_vpc" "my-vpc" {
 cidr_block = "10.0.0.0/16"
 tags={
    Name="day-02-akhilesh-vpc"
 }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "day-02-akhilesh-ig"
  }
}
# resource "aws_internet_gateway_attachment" "gwat" {
#   internet_gateway_id = aws_internet_gateway.gw.id
#   vpc_id              = aws_vpc.my-vpc.id
# }
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
   map_public_ip_on_launch = true
  tags = {
    Name = "day-02-akhilesh-sb"
  }
}


resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  
  tags = {
    Name = "day-02-akhilesh-rt"
  }
}
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.route-table.id
}
# resource "aws_route_table_association" "b" {
#   gateway_id     = aws_internet_gateway.gw.id
#   route_table_id = aws_route_table.route-table.id
# }
resource "aws_security_group" "web_sg" {
  vpc_id = aws_vpc.my-vpc.id

  ingress {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
     cidr_blocks = ["0.0.0.0/0"]
  }
  
}
module "my_web_server" {
  source = "./modules/ec2_instance"

  instance_type      = var.instance_type
  ami_id             = var.web_server_ami
  subnet_id          = aws_subnet.public.id
  security_group_ids = [aws_security_group.web_sg.id]
  tags = {
    Name = "WebServer-from-Module"
  }
}

