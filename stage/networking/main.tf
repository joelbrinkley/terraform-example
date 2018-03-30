module "networking" {
  source                  = "../../modules/networking"
  location                = "East US"
  name                    = "jb-terraform"
  vnet_address_spacing    = ["10.0.0.0/16"]
  subnet_address_prefixes = ["10.0.1.0/24"]
}


#add peering