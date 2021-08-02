resource "aws_iam_role_policy_attachment" "cloudwatch-loki-shipper" {
  role       = aws_iam_role.cloudwatch-loki-shipper.name
  policy_arn = aws_iam_policy.cloudwatch-loki-shipper.arn
}

resource "aws_iam_role_policy_attachment" "cloudwatch-loki-shipper-vpc-policy" {
  role       = aws_iam_role.cloudwatch-loki-shipper.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

resource "aws_iam_role" "cloudwatch-loki-shipper" {
  name_prefix = local.name_prefix_shipper

  assume_role_policy = <<-EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
            "Service": "lambda.amazonaws.com"
          },
          "Effect": "Allow",
          "Sid": ""
        }
      ]
    }
  EOF
}

resource "aws_iam_policy" "cloudwatch-loki-shipper" {
  name_prefix = local.name_prefix_shipper

  policy = <<-EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:*",
            "logs:PutLogEvents"
          ],
          "Resource": "arn:aws:logs:*:*:*",
          "Effect": "Allow"
        },
        {
          "Action": [
            "ec2:DescribeNetworkInterfaces",
            "ec2:CreateNetworkInterface",
            "ec2:DeleteNetworkInterface"
          ],
          "Resource": "*",
          "Effect": "Allow"
        }
      ]
    }
  EOF
}
