variable "rg1"{}
variable "sto1"{}


module "rg"{
  source = "../../modules/resource_group"
    rg = var.rg1
}
module "storage"{
    source = "../../modules/storage_account"
    depends_on = [module.rg]
    storage =var.sto1
}