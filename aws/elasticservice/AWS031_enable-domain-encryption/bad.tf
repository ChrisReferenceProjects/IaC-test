# check no encrypt_at_rest block aws_elasticsearch_domain
resource "aws_elasticsearch_domain" "my_elasticsearch_domain" {
	
}

# check false enabled attr aws_elasticsearch_domain
resource "aws_elasticsearch_domain" "my_elasticsearch_domain" {
  domain_name = "domain-foo"

  encrypt_at_rest { }
}