# check encryption key id specified for aws_sns_topic
resource "aws_sns_topic" "my-topic" {
	kms_master_key_id = "/blah"
}