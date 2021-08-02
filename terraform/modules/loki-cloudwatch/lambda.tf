resource "aws_lambda_function" "cloudwatch-loki-shipper" {
  filename         = var.lambda_location
  source_code_hash = sha256(filebase64(var.lambda_location))
  function_name    = var.lambda_name
  role             = aws_iam_role.cloudwatch-loki-shipper.arn
  handler          = "main"
  memory_size      = "128"
  runtime          = "go1.x"
  timeout          = "600"
  environment {
    variables = {
      PROMTAIL_ADDRESS = var.promtail_url
    }
  }
  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }
}
