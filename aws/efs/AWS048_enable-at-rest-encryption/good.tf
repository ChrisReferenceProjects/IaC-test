# Encryption key is provided
resource "aws_efs_file_system" "good_example" {
  name       = "bar"
  encrypted  = true
  kms_key_id = "my_kms_key"
}