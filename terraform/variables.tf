variable "ec2_instance_type"{
    description = "The type of EC2 instance to use for the web server"
    type        = string
    default     = "t3.micro"
}

variable "ec2_default_root_storage_size"{
    default = 15
    type = number
}
variable "ec2_ami_id"{
    description = "The ID of the Amazon Machine Image (AMI) to use for the EC2 instance"
    type        = string
    default     = "ami-06e3c045d79fd65d9" # Amazon Linux 2 AMI (HVM), SSD Volume Type
}
variable "env"{
    description = "The environment for which the infrastructure is being provisioned (e.g., dev, staging, prod)"
    type        = string
    default     = "dev"
}

