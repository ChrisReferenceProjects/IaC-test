# check no node_to_node_encryption block aws_elasticsearch_domain
resource "aws_elasticsearch_domain" "my_elasticsearch_domain" {
	
}

# check false enabled attr aws_elasticsearch_domain
resource "aws_elasticsearch_domain" "my_elasticsearch_domain" {
  domain_name = "domain-foo"

  node_to_node_encryption {
    enabled = false
  }
}

