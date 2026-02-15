module "dev-infra"{
    source = "./infra-app"
    env = "dev"
    bucket_name = "infra-app-bucket"
    instance_count = 1
    instance_type = "t3.micro"
    ec2_ami_id = "ami-06e3c045d79fd65d9"
    hash_key = "studentID"
}
module "prd-infra"{
    source = "./infra-app"
    env = "prd"
    bucket_name = "infra-app-bucket"
    instance_count = 2
    instance_type = "t3.small"
    ec2_ami_id = "ami-06e3c045d79fd65d9"
    hash_key = "studentID"
}
module "stg-infra"{
    source = "./infra-app"
    env = "stg"
    bucket_name = "infra-app-bucket"
    instance_count = 1
    instance_type = "t3.micro"
    ec2_ami_id = "ami-06e3c045d79fd65d9"
    hash_key = "studentID"
}
