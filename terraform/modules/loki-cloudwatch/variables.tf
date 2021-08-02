variable "lambda_name" {
  default = "cloudwatch-loki-shipper"
}
variable "lambda_location" {}

variable "promtail_url" {
//  default = "http://10.10.10.10:3100/loki/api/v1/push"
}

variable "log_group_name" {
//  default = "/aws/containerinsights/sit-ortrta-eks-cluster/application"
}
variable "subnet_ids" {
  type = list(string)
}
variable "security_group_ids" {
  type = list(string)
}
