provider "azurerm" { }

resource "azurerm_resource_group" "terraform_rg" {
  name     = "jb-terraform"
  location = "eastus"
}

resource "azurerm_storage_account" "terraform_state" {
  name                     = "jbterraformstate"
  resource_group_name      = "${azurerm_resource_group.terraform_rg.name}"
  location                 = "eastus"
  account_tier             = "standard"
  account_replication_type = "lrs"
}
