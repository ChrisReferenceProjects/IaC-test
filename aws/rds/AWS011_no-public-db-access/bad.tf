resource "aws_db_instance" "my-resource" {
	publicly_accessible = true
}

resource "aws_dms_replication_instance" "my-resource" {
	publicly_accessible = true
}

resource "aws_rds_cluster_instance" "my-resource" {
	publicly_accessible = true
}

resource "aws_redshift_cluster" "my-resource" {
	publicly_accessible = true
}

resource "aws_redshift_cluster" "my-resource" {
	publicly_accessible = false
}