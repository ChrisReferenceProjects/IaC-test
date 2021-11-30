# check aws_api_gateway_domain_name with ok policy
resource "aws_api_gateway_domain_name" "my-resource" {
	security_policy = "TLS_1_2"
}