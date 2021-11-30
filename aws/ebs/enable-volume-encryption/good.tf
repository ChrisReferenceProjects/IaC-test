resource "aws_ebs_volume" "good_example" {
  availability_zone = "us-west-2a"
  size              = 40

  tags = {
    Name = "HelloWorld"
  }
  encrypted = true
}