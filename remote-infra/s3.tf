resource aws_s3_bucket "remote_s3"{
    bucket ="kundan-state-bucket"

    tags = {
        Name = "kundan-state-bucket"
    }
}