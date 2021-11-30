resource "aws_kms_key" "ebs_encryption" {
	enable_key_rotation = true
}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-west-2a"
  size              = 40

  kms_key_id = aws_kms_key.ebs_encryption.arn

  tags = {
    Name = "HelloWorld"
  }
}