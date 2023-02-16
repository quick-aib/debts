module "servers" {
  source = "./ec2"
  type ="t2.micro"
}
module "servnetworksers" {
  source = "./vpc"
  type ="t2.micro"
}