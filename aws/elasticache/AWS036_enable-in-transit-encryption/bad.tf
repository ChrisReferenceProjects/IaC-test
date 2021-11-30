# check aws_elasticache_replication_group missing transit_encryption_enabled
resource "aws_elasticache_replication_group" "my-resource" {
        replication_group_id = "foo"
        replication_group_description = "my foo cluster"
}