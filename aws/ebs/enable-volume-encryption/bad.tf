resource "aws_ebs_volume" "bad_example" {
  availability_zone = "us-west-2a"
  size              = 40

  tags = {
    Name = "HelloWorld"
  }
  encrypted = false
}

# encrypted not provided => false
resource "aws_ebs_volume" "bad_example" {
  availability_zone = "us-west-2a"
  size              = 40

  tags = {
    Name = "HelloWorld"
  }
}