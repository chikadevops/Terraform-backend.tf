# Create Amazon S3 bucket
resource "aws_s3_bucket" "my_state_file_bucket" {
  bucket        = "statefilebucket-808"
  force_destroy = true

  tags = {
    Name = "statefilebucket-808"
    Env  = "demo"
  }
}

# Enable versioning on the S3 bucket
resource "aws_s3_bucket_versioning" "my_state_file_bucket_versions" {
  bucket = aws_s3_bucket.my_state_file_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption on the S3 bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "my_state_file_bucket_encryption" {
  bucket = aws_s3_bucket.my_state_file_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Create DynamoDB table for state locking
resource "aws_dynamodb_table" "statelocktable" {
  name         = "my-state-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "my-state-lock-table"
    Env  = "demo"
  }
}
