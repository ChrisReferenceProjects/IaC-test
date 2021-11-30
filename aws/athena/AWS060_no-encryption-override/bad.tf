# test athena workgroup with configuration but enforce set to false
resource "aws_athena_workgroup" "good_example" {
  name = "example"

  configuration {
    enforce_workgroup_configuration    = false
    publish_cloudwatch_metrics_enabled = true

    result_configuration {
      output_location = "s3://${aws_s3_bucket.example.bucket}/output/"

      encryption_configuration {
        encryption_option = "SSE_KMS"
        kms_key_arn       = aws_kms_key.example.arn
      }
    }
  }
}

# test athena workgroup with no configuration at all
resource "aws_athena_workgroup" "good_example" {
  name = "example"
}