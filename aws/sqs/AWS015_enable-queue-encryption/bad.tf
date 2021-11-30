# check no encryption key id specified for aws_sqs_queue
resource "aws_sqs_queue" "bad_example" {
	# no key specified
}

# check blank encryption key id specified for aws_sqs_queue
resource "aws_sqs_queue" "my-queue" {
    # blank encryption key specified
	kms_master_key_id = "" 
}