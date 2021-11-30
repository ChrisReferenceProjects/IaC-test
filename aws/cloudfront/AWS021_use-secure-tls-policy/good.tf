#
resource "aws_cloudfront_distribution" "good_example" {
  viewer_certificate {
    cloudfront_default_certificate = true
    minimum_protocol_version = "TLSv1.2_2021"
  }
}