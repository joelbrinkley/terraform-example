provider "azurerm" { }

resource "azurerm_resource_group" "terraform-rg" {
  name     = "jb-terraform"
  location = "eastus"
}