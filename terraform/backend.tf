terraform {
  backend "s3" {
    bucket = "passeidireto-challenge"
    key    = "prod/key"
    region = "us-east-1"
  }
}