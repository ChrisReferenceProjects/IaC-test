# check MSK broker with client_broker set to TLS"
resource "aws_msk_cluster" "msk-cluster" {
	encryption_info {
		encryption_in_transit {
			client_broker = "TLS"
		}
	}
}
