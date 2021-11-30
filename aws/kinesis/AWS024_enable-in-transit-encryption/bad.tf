# check no encryption specified for aws_kinesis_stream
resource "aws_kinesis_stream" "test_stream" {
	
}

# check encryption disabled for aws_kinesis_stream
resource "aws_kinesis_stream" "bad_example" {
	encryption_type = "NONE"
}

# check no encryption key id specified for aws_kinesis_stream
resource "aws_kinesis_stream" "test_stream" {
	encryption_type = "KMS"
}