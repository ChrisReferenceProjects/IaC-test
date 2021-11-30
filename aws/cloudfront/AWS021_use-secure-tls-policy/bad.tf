# check no viewer_certificate block in aws_cloudfront_distribution
resource "aws_cloudfront_distribution" "s3_distribution" {

}

# check no default minimum_protocol_version attribute in viewer_certificate block
resource "aws_cloudfront_distribution" "s3_distribution" {
  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

# check TLSv1.2_2019 not used
resource "aws_cloudfront_distribution" "s3_distribution" {
  viewer_certificate {
    cloudfront_default_certificate = true
	  minimum_protocol_version = "TLSv1.2_2018"
  }
}

resource "aws_cloudfront_distribution" "bad_example" {
  viewer_certificate {
    cloudfront_default_certificate = true
    minimum_protocol_version = "TLSv1.0"
  }
}