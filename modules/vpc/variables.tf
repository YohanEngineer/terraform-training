variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "default" {
  description = "Whether this is the default VPC"
  type        = bool
  default     = false

}

variable "sg_id" {
  description = "The ID of the security group"
  type        = string

}

variable "environment" {
  description = "The environment for the VPC"
  type        = string

}

variable "subnet_cidr" {
  description = "The CIDR block for the subnet"
  type        = string

}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string

}
