output "instance_id" {
  value = aws_instance.tp_devops_instance.id
}

output "public_ip" {
  value = aws_instance.tp_devops_instance.public_ip
}
