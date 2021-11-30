# check no root_block_device configured in launch configuration
resource "aws_launch_configuration" "my-launch-config" {
	
}

# check no encryption configured for ebs_block_device
resource "aws_launch_configuration" "my-launch-config" {
	root_block_device {}
}

# check no encryption configured for ebs_block_device
resource "aws_launch_configuration" "my-launch-config" {
	root_block_device {
		encrypted = true
	}
	ebs_block_device {}
}

# check encryption disabled for root_block_device
resource "aws_launch_configuration" "my-launch-config" {
	root_block_device {
		encrypted = false
	}
}

# check encryption disabled for ebs_block_device
resource "aws_launch_configuration" "my-launch-config" {
	root_block_device {
		encrypted = true
	}
	ebs_block_device {
		encrypted = false
	}
}

# check encryption enabled for one ebs_block_device and not for another
resource "aws_launch_configuration" "my-launch-config" {
	root_block_device {
		encrypted = true
	}
	ebs_block_device{
		encrypted  = true
	}
	ebs_block_device{
		encrypted  = false
	}
}
