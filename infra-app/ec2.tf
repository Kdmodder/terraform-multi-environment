#key pair
resource "aws_key_pair" "my_key" {
  key_name   = "${var.env}-infra-app-key"
  public_key = file("kdmodder-ssh-key.pub")
  tags = {
    Environment = var.env
  }
}

# vpc and security group
resource "aws_default_vpc" "default" {


}

resource "aws_security_group" "my_security_group" {
  name        = "${var.env}-infra-app-sg"
  description = "this will automate sg"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH access from anywhere"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP access from anywhere"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
  tags = {
    Name = "${var.env}-infra-app-sg"
    
  }
}

#ec2 instance
resource "aws_instance" "my_instance" {

  #count = 2
 count = var.instance_count

  depends_on =[aws_security_group.my_security_group,aws_key_pair.my_key]
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  instance_type          = var.instance_type
  ami                    = var.ec2_ami_id
  #user_data               = file("install_nginx.sh")

  root_block_device {
    volume_size = var.env =="prd" ? 20 : 10
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.env}-infra-app-instance"
    Environment = var.env
  }
}

# resource "aws_instance" my_new_instance{
#   ami ="unknown"
#   instance_type ="unknown"
# }

