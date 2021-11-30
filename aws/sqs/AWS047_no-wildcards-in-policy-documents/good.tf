# check with actions defined as an array
resource "aws_sqs_queue_policy" "test" {
  queue_url = aws_sqs_queue.q.id

  policy = <<POLICY
{
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": ["sqs:SendMessage", "sqs:ReceiveMessage"],
    }
  ]
}
POLICY
}

resource "aws_sqs_queue_policy" "good_example" {
  queue_url = aws_sqs_queue.q.id

  policy = <<POLICY
{
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage"
    }
  ]
}
POLICY
}