module "loki-shipper" {
  source             = "./modules/loki-cloudwatch"
  lambda_name        = "cloudwatch-loki-shipper"
  lambda_location    = "../promtail/main.zip"
  security_group_ids = ["sg-07f52125196a180df"]
  subnet_ids         = ["subnet-0701a727fcbc059be", "subnet-59c0dd1f", "subnet-7369383a"]
  promtail_url       = "http://10.10.5.90:3100/loki/api/v1/push"
  log_group_name     = "/aws/containerinsights/sit-ortrta-eks-cluster/application"
}
