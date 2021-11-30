# check aws_api_gateway_domain_name with outdated policy
resource "aws_api_gateway_domain_name" "my-resource" {
	security_policy = "TLS_1_0"
}

# check aws_api_gateway_domain_name with empty security policy
resource "aws_api_gateway_domain_name" "my-resource" {
	security_policy = ""
}

# check aws_api_gateway_domain_name without security policy
resource "aws_api_gateway_domain_name" "my-resource" {
	domain=""
}
