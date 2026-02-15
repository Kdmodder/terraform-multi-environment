variable "env"{
    description = "The environment for which the infrastructure is being provisioned (e.g., dev, staging, prod)"
    type        = string

}
variable "bucket_name"{
    description = "The name of the S3 bucket to be created"
    type        = string

}
variable "instance_count"{
    description = "Number of EC2 instances to create"
    type        = number
}
variable "instance_type"{
    description = "The type of EC2 instance to create (e.g., t3.micro)"
    type        = string
}
variable "ec2_ami_id"{
    description = "The AMI ID to use for the EC2 instances"
    type        = string
}
variable "hash_key"{
    description = "The name of the hash key for the DynamoDB table"
    type        = string
}