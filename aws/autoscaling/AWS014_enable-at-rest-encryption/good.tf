# check encryption enabled for root_block_device
resource "aws_launch_configuration" "my-launch-config" {
	root_block_device {
		encrypted = true
	}
}

# check encryption enabled for root_block_device and ebs_block_device
resource "aws_launch_configuration" "my-launch-config" {
	root_block_device {
		encrypted = true
	}
	ebs_block_device {
		encrypted = true
	}
}

# check encryption enabled by default for root_block_device
resource "aws_ebs_encryption_by_default" "example" {
  enabled = true
}

resource "aws_launch_configuration" "my-launch-config" {
	root_block_device {

	}
}

# check encryption enabled by default for non-specified root_block_device
resource "aws_ebs_encryption_by_default" "example" {
  enabled = true
}

resource "aws_launch_configuration" "my-launch-config" {

}

# check encryption enabled by default for non-specified root_block_device and ebs_block_device
resource "aws_ebs_encryption_by_default" "example" {
  enabled = true
}

resource "aws_launch_configuration" "my-launch-config" {
	ebs_block_device{}
}


