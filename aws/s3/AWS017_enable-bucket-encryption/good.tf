resource "aws_s3_bucket" "this" {
   bucket = "accesslog"
   acl    = "private"
 
   lifecycle_rule {
     id      = "log"
     enabled = true
 
     prefix = "log/"
 
     tags = {
       "rule"      = "log"
       "autoclean" = "true"
     }
 
     transition {
       days          = 30
       storage_class = "STANDARD_IA" # or "ONEZONE_IA"
     }
 
     transition {
       days          = 60
       storage_class = "GLACIER"
     }
 
     expiration {
       days = 90
     }
	}
 
     server_side_encryption_configuration {
       rule {
         apply_server_side_encryption_by_default {
           kms_master_key_id = aws_kms_key.s3.arn
           sse_algorithm     = "aws:kms"
         }
       }
     }
 
     versioning {
       mfa_delete = true
     }
 
     #checkov:skip=CKV_AWS_18:This S3 does not need logging to be enabled
     #tfsec:ignore:AWS002 This S3 does not need logging to be enabled
}

resource "aws_s3_bucket" "good_example" {
  bucket = "mybucket"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "arn"
        sse_algorithm     = "aws:kms"
      }
    }
  }
}