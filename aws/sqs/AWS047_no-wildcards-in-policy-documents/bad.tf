# check with prefixed wildcard action
resource "aws_sqs_queue_policy" "test" {
  queue_url = aws_sqs_queue.q.id

  policy = <<POLICY
{
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "sqs:*"
    }
  ]
}
POLICY
}

resource "aws_sqs_queue_policy" "bad_example" {
  queue_url = aws_sqs_queue.q.id

  policy = <<POLICY
{
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "*"
    }
  ]
}
POLICY
}