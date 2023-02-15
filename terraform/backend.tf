terraform {
  backend "s3" {
    bucket = "docexample1233418112022747"
    key    = "terraform/terraform.tfstate"
    region = "ap-south-1"
  }
}
