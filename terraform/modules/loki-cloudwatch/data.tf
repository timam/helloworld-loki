locals {
  name_prefix_shipper = "ship-"
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}
