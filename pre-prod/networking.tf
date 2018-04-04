provider "azurerm" {
  version = "1.3.0"
}

module "networking" "jb-test-network" {
  source                  = "../modules/networking"
  location                = "${var.location}"
  name                    = "jb-test" 
  vnet_address_spacing    = "10.0.0.0/16"
  subnet_address_prefixes = "10.0.1.0/24"
}



#add peering