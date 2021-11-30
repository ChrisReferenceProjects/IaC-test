# Rule should not pass when no SSE block at all
resource "aws_dax_cluster" "bad_example" {
	// no server side encryption at all
}

# Rule should not pass when SSE block empty
resource "aws_dax_cluster" "bad_example" {
	// other DAX config

	server_side_encryption {
		// empty server side encryption config
	}
}

# Rule should not pass when SSE disabled
resource "aws_dax_cluster" "bad_example" {
	// other DAX config

	server_side_encryption {
		enabled = false // disabled server side encryption
	}
}