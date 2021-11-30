# Encryption of the underlying storage used by DocumentDB ensures that if their is compromise of the disks, the data is still protected.
resource "aws_docdb_cluster" "bad_example" {
  cluster_identifier      = "my-docdb-cluster"
  engine                  = "docdb"
  master_username         = "foo"
  master_password         = "mustbeeightchars"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true
  storage_encrypted = false
}