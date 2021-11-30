# check no "domain_endpoint_options" aws_elasticsearch_domain
# 
# SonarSource Note:
# By default enforce_https is set to true
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticsearch_domain#enforce_https
# Therefore, raising an issue when enforce_https is not set is most likely an FP.
resource "aws_elasticsearch_domain" "my_elasticsearch_domain" {
	
}

# check false enforce_https attr aws_elasticsearch_domain
resource "aws_elasticsearch_domain" "my_elasticsearch_domain" {
  domain_name = "domain-foo"

  domain_endpoint_options {
    enforce_https = false
  }
}
