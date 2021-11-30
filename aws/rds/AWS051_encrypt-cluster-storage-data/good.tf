# check rds encryption is enabled correctly
resource "aws_rds_cluster" "my-instance" {
	name              = "cluster-1"
	kms_key_id  = "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
	storage_encrypted = true
}

# check rds encryption with storage_encrypted but no kms_id
resource "aws_rds_cluster" "my-instance" {
	name              = "cluster-1"
	storage_encrypted = true
}

resource "aws_kms_key" "rds" {
	enable_key_rotation = true
}
resource "aws_rds_cluster" "rds_cluster" {
	engine                          = "aurora-mysql"
	engine_version                  = "5.7.mysql_aurora.2.09.1"
	storage_encrypted               = true
	kms_key_id                      = aws_kms_key.rds.arn
}
