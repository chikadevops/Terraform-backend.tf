resource "aws_s3_bucket" "special-s3-bucket" {
    bucket          = "special-s3-bucket-001"

    tags            = {
        name        = "special-s3-bucket-tag"
    }
}