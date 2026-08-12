terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.0.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "sheetal-rg"
    storage_account_name = "shstoragenew"
    container_name       = "mycontainer"
    key                  = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}