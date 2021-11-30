# check encryption key id specified for aws_sqs_queue
resource "aws_sqs_queue" "my-queue" {
	kms_master_key_id = "/blah"
}