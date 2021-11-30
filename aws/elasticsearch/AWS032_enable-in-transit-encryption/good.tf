# check true enabled attr aws_elasticsearch_domain
resource "aws_elasticsearch_domain" "my_elasticsearch_domain" {
  domain_name = "domain-foo"

  node_to_node_encryption {
    enabled = true
  }
}

# check true enabled attr aws_elasticsearch_domain
resource "aws_elasticsearch_domain" "my_elasticsearch_domain" {
  domain_name = "domain-foo"

  node_to_node_encryption {
    enabled = "true"
  }
}