resource "aws_s3_bucket" "good_example" {
	versioning {
		enabled = true
	}
}
