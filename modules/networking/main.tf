resource "azurerm_resource_group" "module" {
  name     = "${local.module_name}-rg"
  location = "${var.location}"
}

resource "azurerm_virtual_network" "module"{
  name                = "${local.module_name}-vnet"
  address_space       = ["${var.vnet_address_spacing}"]
  location            = "${azurerm_resource_group.module.location}"
  resource_group_name = "${azurerm_resource_group.module.name}"
}

resource "azurerm_subnet" "module"{
  name                 = "${local.module_name}-subnet"
  resource_group_name  = "${azurerm_resource_group.module.name}"
  virtual_network_name = "${azurerm_virtual_network.module.name}"
  address_prefix       = "${var.subnet_address_prefixes}"
}