provider "aws" {
  region = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  endpoints {
    dynamodb   = "http://localhost:4566"
    apigateway = "http://localhost:4566"
    sts        = "http://localhost:4566"
    sns        = "http://localhost:4566"
  }
}
