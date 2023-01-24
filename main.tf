provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "Terralejandro" {
    ami = "ami-00874d747dde814fa"
    instance_type = "t2.micro"

    tags = {
        Name = "Terralejandro"
    }
    /*network_interface {
      network_interface_id = aws_network_interface.Terralejandro
      device_index = 0
    }
    
    credit_specification {
      cpu_credits = "unlimited"
    }*/
}