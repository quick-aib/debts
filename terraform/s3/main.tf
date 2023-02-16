resource "aws_s3_bucket" "b" {
  for_each            = var.s3
  bucket = each.value.bucketname
  region = each.value.region
  tags = {
    Name        = each.value.tag
    Environment = each.value.env
  }
}