resource "aws_s3_bucket" "bad_example" {
	acl = "public-read"
}

resource "aws_s3_bucket" "my-bucket" {
	acl = "public-read"
	logging {

	}
}

resource "aws_s3_bucket" "my-bucket" {
	acl = "public-read-write"
	logging {}
}

resource "aws_s3_bucket" "my-bucket" {
	acl = "website"
}