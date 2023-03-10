provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "terralejandro" {
    ami = "ami-00874d747dde814fa"
    instance_type = "t2.micro"

    tags = {
        Name = "Terralejandro"
    }

    user_data = <<-EOF
      #!/bin/bash
      echo "Hello, World!" > index.html
      nohup busybox httpd -f -p ${var.server_port} &
      EOF

    user_data_replace_on_change = true

    vpc_security_group_ids = [aws_security_group.allow_web.id]
}

resource "aws_security_group" "allow_web" {
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}