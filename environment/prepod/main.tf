variable "rg1"{}



module "rg"{
  source = "../../modules/resource_group"
    rg = var.rg1
}
