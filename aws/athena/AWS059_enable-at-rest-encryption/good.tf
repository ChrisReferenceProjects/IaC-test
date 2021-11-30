# test athena database with encryption configuration
resource "aws_athena_database" "good_example" {
  name   = "database_name"
  bucket = aws_s3_bucket.hoge.bucket

  encryption_configuration {
     encryption_option = "SSE_KMS"
     kms_key_arn       = aws_kms_key.example.arn
 }
}

# test athena workgroup with encryption configuration in results configuration
resource "aws_athena_workgroup" "good_example" {
  name = "example"

  configuration {
    enforce_workgroup_configuration    = true
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

# test athena workgroup with no results configuration
resource "aws_athena_workgroup" "good_example" {
  name = "example"

  configuration {
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true
  }
}