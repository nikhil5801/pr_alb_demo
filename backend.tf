terraform {
  backend "s3" {
    bucket = "terraform-code-test-bucket"
    key    = "alb_demo"
    region = "ap-south-1"
  }
}