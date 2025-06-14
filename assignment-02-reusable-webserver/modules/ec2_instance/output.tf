output "instance_id" {
value=aws_instance.my_instance.id
}
output "instance_ip" {
  value = aws_instance.my_instance.public_ip
}