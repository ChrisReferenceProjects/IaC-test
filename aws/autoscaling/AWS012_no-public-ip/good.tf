# check aws_instance without public ip associated
resource "aws_instance" "my-resource" {
	associate_public_ip_address = false
}

# check aws_instance without public ip explicitly associated
resource "aws_instance" "my-resource" {
}

resource "aws_launch_configuration" "good_example" {
	associate_public_ip_address = false
}