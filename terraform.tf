terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.31.0"
    }
  }
#   backend "s3"{
#     bucket = "kundan-state-bucket"
#     key    = "terraform.tfstate"
#     region = "us-east-2"
#     dynamodb_table = "kundan-state-table"
#   }
}
