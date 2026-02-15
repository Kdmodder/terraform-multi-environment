resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "kundan-state-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  

    attribute {
        name = "LockID"
        type = "S"
    }
  tags = {
    Name        = "kundan-state-table"
    Environment = "production"
  }
}