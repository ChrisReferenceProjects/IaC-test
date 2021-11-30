# Rule should pass when SSE is enabled
resource "aws_dax_cluster" "good_example" {
	// other DAX config

	server_side_encryption {
		enabled = true // enabled server side encryption
	}
}