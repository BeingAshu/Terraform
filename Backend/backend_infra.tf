resource "aws_s3_bucket" "backendbucket" {
    bucket = var.backendbucket

  
}

resource "aws_dynamodb_table" "mybackendtable" {
  name = var.backendtablename
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
