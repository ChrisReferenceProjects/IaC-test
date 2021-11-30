# check aws_elasticache_replication_group with at_rest_encryption_enabled
resource "aws_elasticache_replication_group" "my-resource" {
        replication_group_id = "foo"
        replication_group_description = "my foo cluster"

        at_rest_encryption_enabled = true
}

#
resource "aws_elasticache_replication_group" "good_example" {
        replication_group_id = "foo"
        replication_group_description = "my foo cluster"

        at_rest_encryption_enabled = true
}