# check rds is not specified
resource "aws_rds_cluster" "my-instance" {
	name = "cluster-1"
}

# check rds kms is specified but false
resource "aws_rds_cluster" "my-instance" {
	name       = "cluster-1"
	kms_key_id  = ""
}

# check rds kms is specified but not storage_encrypted
resource "aws_rds_cluster" "my-instance" {
	name       = "cluster-1"
	kms_key_id  = "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
}

# check rds storage_encrypted is false and key_id is null
resource "aws_rds_cluster" "my-instance" {
	name       = "cluster-1"
	storage_encrypted = false
	kms_key_id = null
}
