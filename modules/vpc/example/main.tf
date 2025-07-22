provider "aws" {
  region = "ap-southeast-1"
}

variable "name" {}
variable "vpc_cidr" {}
variable "azs" {}
variable "public_subnet_cidrs" {}
variable "private_subnet_cidrs" {}
variable "create_nat_gateway" {}
variable "nat_eip_allocation_id" {}
variable "sg_description" {}
variable "sg_ingress_rules" {}
variable "sg_egress_rules" {}

module "vpc" {
  source = "git::https://github.com/alterneta/reusable-terraform-module.git//modules/vpc"

  name                    = var.name
  vpc_cidr                = var.vpc_cidr
  azs                     = var.azs
  public_subnet_cidrs     = var.public_subnet_cidrs
  private_subnet_cidrs    = var.private_subnet_cidrs
  create_nat_gateway      = var.create_nat_gateway
  nat_eip_allocation_id   = var.nat_eip_allocation_id
  sg_description          = var.sg_description
  sg_ingress_rules        = var.sg_ingress_rules
  sg_egress_rules         = var.sg_egress_rules
}
