variable "aws_region" {
  default = "us-east-1"
}

variable "ami_id" {
  description = "Amazon Linux 2023"
  default     = "ami-0f88e80871fd81e91"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "Key pair name to use for SSH access"
}

variable "public_key_path" {
  description = "Path to the SSH public key"
}


variable "my_ip" {
  description = "my public IP address with /32 subnet"
}
