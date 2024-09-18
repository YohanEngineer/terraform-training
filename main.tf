module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = "10.0.0.0/16"
  default     = false
  sg_id       = "sg-1234567890abcdef"
  vpc_id      = "vpc-1234567890abcdef"
  environment = "development"
  subnet_cidr = "10.0.1.0/24"
  subnet_id   = "subnet-1234567890abcdef"
}
