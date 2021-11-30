# check aws_launch_configuration with public ip associated
resource "aws_launch_configuration" "my-resource" {
	associate_public_ip_address = true
}

# check aws_instance with public ip associated
resource "aws_instance" "my-resource" {
	associate_public_ip_address = true
}