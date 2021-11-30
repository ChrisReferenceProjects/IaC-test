# Test check fails when missing kms id
resource "aws_cloudtrail" "bad_example" {
  is_multi_region_trail = true
  enable_log_file_validation = true

  event_selector {
    read_write_type           = "All"
    include_management_events = true

    data_resource {
      type = "AWS::S3::Object"
      values = ["${data.aws_s3_bucket.important-bucket.arn}/"]
    }
  }
}

# Test check fails when kms_key_id present but empty
resource "aws_cloudtrail" "bad_example" {
  is_multi_region_trail = true
  enable_log_file_validation = true
  kms_key_id = ""

  event_selector {
    read_write_type           = "All"
    include_management_events = true

    data_resource {
      type = "AWS::S3::Object"
      values = ["${data.aws_s3_bucket.important-bucket.arn}/"]
    }
  }
}