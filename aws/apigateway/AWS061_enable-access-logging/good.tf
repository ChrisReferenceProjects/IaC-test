resource "aws_apigatewayv2_stage" "good_example" {
  api_id = aws_apigatewayv2_api.example.id
  name   = "example-stage"

  access_log_settings {
    destination_arn = ""
    format          = ""
  }
}

resource "aws_api_gateway_stage" "good_example" {
  deployment_id = aws_api_gateway_deployment.example.id
  rest_api_id   = aws_api_gateway_rest_api.example.id
  stage_name    = "example"

  access_log_settings {
    destination_arn = ""
    format          = ""
  }
}
