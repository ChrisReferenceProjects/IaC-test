# check MSK broker with encryption_in_transit not set
resource "aws_msk_cluster" "msk-cluster" {
	encryption_info {
		encryption_in_transit {
			client_broker = "TLS_PLAINTEXT"
			in_cluster = true
		}
	}
}

# check MSK broker with client_broker not set
resource "aws_msk_cluster" "msk-cluster" {
	encryption_info {
		encryption_in_transit {
		}
	}
}

# check MSK broker with client_broker set to PLAINTEXT
resource "aws_msk_cluster" "msk-cluster" {
	encryption_info {
		encryption_in_transit {
			client_broker = "PLAINTEXT"
		}
	}
}

# check MSK broker with client_broker set to TLS_PLAINTEXT
resource "aws_msk_cluster" "msk-cluster" {
	encryption_info {
		encryption_in_transit {
			client_broker = "TLS_PLAINTEXT"
		}
	}
}

resource "aws_msk_cluster" "bad_example" {
	encryption_info {
		encryption_in_transit {
			client_broker = "TLS_PLAINTEXT"
			in_cluster = true
		}
	}
}