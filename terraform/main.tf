provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "k8s_control_plane" {
  ami           = "ami-0c02fb55956c7d316"  # Ubuntu 22.04 AMI
  instance_type = "t2.medium"
  key_name      = "your-key-name"          # SSH key for login
  tags = {
    Name = "k8s-control-plane"
  }
}

resource "aws_instance" "k8s_worker" {
  ami           = "ami-0c02fb55956c7d316"  # Ubuntu 22.04 AMI
  instance_type = "t2.medium"
  key_name      = "your-key-name"
  tags = {
    Name = "k8s-worker-1"
  }
}

output "control_plane_ip" {
  value = aws_instance.k8s_control_plane.public_ip
}

output "worker_ip" {
  value = aws_instance.k8s_worker.public_ip
}
