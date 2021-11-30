resource "aws_s3_bucket" "good_example" {
	logging {
		target_bucket = "target-bucket"
	}
}

resource "aws_s3_bucket" "my-bucket" {
	acl = "log-delivery-write"
}
