# check encryption key id specified for aws_sqs_queue
resource "aws_kinesis_stream" "good_example" {
	encryption_type = "KMS"
	kms_key_id = "my/key"
}