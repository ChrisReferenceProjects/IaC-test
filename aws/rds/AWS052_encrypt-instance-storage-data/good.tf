# Encryption using specified CMK enabled on db instance
resource "aws_db_instance" "my-db-instance" {
	storage_encrypted = true
	kms_key_id = "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
}

# Encryption using default CMK enabled on db instance
resource "aws_db_instance" "my-db-instance" {
	storage_encrypted = true
}