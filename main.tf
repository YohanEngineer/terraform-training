module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = "10.0.0.0/16"
  default     = false
  environment = "development"
  subnet_cidr = "10.0.1.0/24"
}
