variable "rg1"{}
variable "sto1"{}


module "rg"{
  source = "../../modules/resource_group"
    rg = var.rg1
}
