resource "aws_s3_bucket" "s3bucket" {
  bucket="projs3bucket23434"

   tags = {
    Name        = "My bucket"
  }
}