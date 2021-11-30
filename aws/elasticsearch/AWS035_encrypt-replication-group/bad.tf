# check aws_elasticache_replication_group missing at_rest_encryption_enabled
resource "aws_elasticache_replication_group" "my-resource" {
        replication_group_id = "foo"
        replication_group_description = "my foo cluster"
}

# You should ensure your Elasticache data is encrypted at rest to help prevent sensitive information from being read by unauthorised users.
resource "aws_elasticache_replication_group" "bad_example" {
        replication_group_id = "foo"
        replication_group_description = "my foo cluster"

        at_rest_encryption_enabled = false
}