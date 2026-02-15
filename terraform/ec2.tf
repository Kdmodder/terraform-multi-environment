#key pair
resource "aws_key_pair" "my_key" {
  key_name   = "kdmodder-ssh-key"
  public_key = file("kdmodder-ssh-key.pub")
}

# vpc and security group
resource "aws_default_vpc" "default" {


}

resource "aws_security_group" "my_security_group" {
  name        = "automate-sg"
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
    Name = "automate-sg"
  }
}

#ec2 instance
resource "aws_instance" "my_instance" {

  #count = 2
  for_each = tomap({
    "instance1" = "t3.micro"
    "instance2" = "t3.small"
    "instance3" = "t3.micro"
  })

  depends_on =[aws_security_group.my_security_group,aws_key_pair.my_key]
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  instance_type          = each.value
  ami                    = var.ec2_ami_id
  user_data               = file("install_nginx.sh")

  root_block_device {
    volume_size = var.env =="prd" ? 20 :var.ec2_default_root_storage_size
    volume_type = "gp3"
  }

  tags = {
    Name = each.key
  }
}

# resource "aws_instance" my_new_instance{
#   ami ="unknown"
#   instance_type ="unknown"
# }

