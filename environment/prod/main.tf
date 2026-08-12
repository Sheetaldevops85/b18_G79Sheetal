variable "rg1"{}
variable "sto1"{}


module "rg"{
    source ="../../../resource_group"
    rg = var.rg1
}
module "storage"{
    source ="../../../storage_account"
    depends_on = [module.rg]
    storage =var.sto1
}