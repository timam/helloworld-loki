resource "aws_lambda_permission" "cloudwatch-loki-shipper" {
  statement_id  = aws_lambda_function.cloudwatch-loki-shipper.function_name
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.cloudwatch-loki-shipper.arn
  principal     = "logs.${data.aws_region.current.name}.amazonaws.com"
  source_arn    = "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:${var.log_group_name}:*"
}

resource "aws_cloudwatch_log_subscription_filter" "cloudwatch-loki-shipper" {
  depends_on      = [aws_lambda_permission.cloudwatch-loki-shipper]
  name            = aws_lambda_function.cloudwatch-loki-shipper.function_name
  log_group_name  = var.log_group_name
  filter_pattern  = ""
  destination_arn = aws_lambda_function.cloudwatch-loki-shipper.arn
}

resource "aws_cloudwatch_log_group" "cloudwatch-loki-shipper" {
  name              = "/aws/lambda/${aws_lambda_function.cloudwatch-loki-shipper.function_name}"
  retention_in_days = 1
}
