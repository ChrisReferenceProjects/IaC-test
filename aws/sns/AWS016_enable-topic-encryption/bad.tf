# check no encryption key id specified for aws_sns_topic
resource "aws_sns_topic" "bad_example" {
	# no key id specified
}

# check blank encryption key id specified for aws_sns_topic
resource "aws_sns_topic" "my-topic" {
	kms_master_key_id = ""
}

# check with default encryption key id specified for aws_sns_topic fails check
data "aws_kms_key" "by_alias" {
  key_id = "alias/aws/sns"
}

resource "aws_sns_topic" "test" {
  name              = "sns_ecnrypted"
  kms_master_key_id = data.aws_kms_key.by_alias.arn
}