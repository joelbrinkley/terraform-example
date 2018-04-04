resource "azurerm_resource_group" "module" {
  name     = "${var.name}-rg"
  location = "${var.location}"
}

#possibly look at making vms a module
resource "azurerm_virtual_machine" "module" {
  name                             = "${var.name}-vm-${count.index}"
  location                         = "${var.location}"
  resource_group_name              = "${azurerm_resource_group.module.name}"
  network_interface_ids            = ["${element(azurerm_network_interface.module.*.id, count.index)}"]
  count                            = "${var.cluster_size}"
  vm_size                          = "${var.vm_size}"
  delete_os_disk_on_termination    = "true"
  delete_data_disks_on_termination = "true"

  storage_image_reference {
    publisher = "${element(split(":",var.os), 0)}"
    offer     = "${element(split(":",var.os), 1)}"
    sku       = "${element(split(":",var.os), 2)}"
    version   = "${element(split(":",var.os), 3)}"
  }

  storage_os_disk {
    caching           = "ReadWrite"
    create_option     = "FromImage"
    name              = "${var.name}-vm-${count.index}_os"
    managed_disk_type = "${var.disk_os_sku}"
  }

  storage_data_disk {
    create_option     = "Empty"
    lun               = 0
    name              = "${var.name}-vm-${count.index}_data-0"
    managed_disk_type = "${var.disk_data_sku}"
    disk_size_gb      = "${var.disk_data_size_gb}"
  }

  os_profile {
    computer_name  = "${var.name}${count.index}"
    admin_username = "${var.admin_username}"
    admin_password = "${var.admin_password}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_public_ip" "module" {
    name                         = "${var.name}-public-ip-${count.index}"
    location                     = "${var.location}"
    resource_group_name          = "${azurerm_resource_group.module.name}"
    public_ip_address_allocation = "dynamic"
    count                        = "${var.cluster_size}"
}

resource "azurerm_network_security_group" "module" {
    name                = "${var.name}-nsg-${count.index}"
    location            = "eastus"
    resource_group_name = "${azurerm_resource_group.module.name}"
    count               = "${var.cluster_size}"
    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
}


resource "azurerm_network_interface" "module" {
  name                = "${var.name}-nic-${count.index}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.module.name}"
  count               = "${var.cluster_size}"
  network_security_group_id = "${element(azurerm_network_security_group.module.*.id, count.index)}"

  ip_configuration {
    name                          = "ipconfig-${count.index}"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${element(azurerm_public_ip.module.*.id, count.index)}"
  }
}
