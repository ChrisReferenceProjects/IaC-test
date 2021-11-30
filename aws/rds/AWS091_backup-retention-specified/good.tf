# rds cluster with retention greater than default passes check
resource "aws_rds_cluster" "good_example" {
	cluster_identifier      = "aurora-cluster-demo"
	engine                  = "aurora-mysql"
	engine_version          = "5.7.mysql_aurora.2.03.2"
	availability_zones      = ["us-west-2a", "us-west-2b", "us-west-2c"]
	database_name           = "mydb"
	master_username         = "foo"
	master_password         = "bar"
	backup_retention_period = 5
	preferred_backup_window = "07:00-09:00"
}

# db instance with retention greater than default passes check
resource "aws_db_instance" "good_example" {
	allocated_storage       = 10
	engine                  = "mysql"
	engine_version          = "5.7"
	instance_class          = "db.t3.micro"
	name                    = "mydb"
	username                = "foo"
	password                = "foobarbaz"
	parameter_group_name    = "default.mysql5.7"
	backup_retention_period = 5
	skip_final_snapshot     = true
}

# db instance with which is a replica with no retention period set  passes check
resource "aws_db_instance" "good_example" {
	allocated_storage       = 10
	engine                  = "mysql"
	engine_version          = "5.7"
	instance_class          = "db.t3.micro"
	name                    = "mydb"
	username                = "foo"
	password                = "foobarbaz"
	parameter_group_name    = "default.mysql5.7"
	backup_retention_period = 5
	skip_final_snapshot     = true
}
resource "aws_db_instance" "good_example_replica" {
	allocated_storage       = 10
	engine                  = "mysql"
	engine_version          = "5.7"
	instance_class          = "db.t3.micro"
	name                    = "mydb"
	username                = "foo"
	password                = "foobarbaz"
	parameter_group_name    = "default.mysql5.7"
	replicate_source_db     = aws_db_instance.good_example_replica.id
	skip_final_snapshot     = true
}

resource "aws_rds_cluster" "good_example" {
	cluster_identifier      = "aurora-cluster-demo"
	engine                  = "aurora-mysql"
	engine_version          = "5.7.mysql_aurora.2.03.2"
	availability_zones      = ["us-west-2a", "us-west-2b", "us-west-2c"]
	database_name           = "mydb"
	master_username         = "foo"
	master_password         = "bar"
	backup_retention_period = 5
	preferred_backup_window = "07:00-09:00"
  }

  resource "aws_db_instance" "good_example" {
	allocated_storage    = 10
	engine               = "mysql"
	engine_version       = "5.7"
	instance_class       = "db.t3.micro"
	name                 = "mydb"
	username             = "foo"
	password             = "foobarbaz"
	parameter_group_name = "default.mysql5.7"
	backup_retention_period = 5
	skip_final_snapshot  = true
}