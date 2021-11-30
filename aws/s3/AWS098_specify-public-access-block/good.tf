# Should pass when a bucket is not missing the public access block
resource "aws_s3_bucket" "example" {
	bucket = "example"
	acl = "private-read"
}
  
resource "aws_s3_bucket_public_access_block" "example" {
	bucket = aws_s3_bucket.example.id
	block_public_acls   = true
	block_public_policy = true
}
