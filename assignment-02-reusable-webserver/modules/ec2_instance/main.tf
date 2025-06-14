resource "aws_instance" "my_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name              = "Day-one-Akhilesh-kp"
  subnet_id             = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  user_data             = <<-eof
    #!/bin/bash
     yum update -y
     yum install -y httpd
    systemctl start httpd
     systemctl enable httpd
    echo "<h1>Hello World from $(hostname -f)   - name </h1>" > /var/www/html/index.html
     eof
 
  tags = var.tags
}
