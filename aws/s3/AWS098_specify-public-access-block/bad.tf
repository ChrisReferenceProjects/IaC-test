# Should fail when a bucket is missing the public access bloc
resource "aws_s3_bucket" "example" {
	bucket = "example"
	acl = "private-read"
}

# Should fail when a bucket is missing the public access block (via foreach)
resource "aws_s3_bucket" "example_foreach_name" {
	for_each      = toset(["example1", "example2"])
	bucket        = each.key
}
resource "aws_s3_bucket_public_access_block" "example" {
	for_each = aws_s3_bucket.example_foreach_name
	bucket   = each.value.id
	
	block_public_acls       = true
	block_public_policy     = true
}