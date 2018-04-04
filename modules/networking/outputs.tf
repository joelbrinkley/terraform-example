output "vnet_id" {
  value       = "${azurerm_virtual_network.module.id}"
  description = "Id of the VNET created"
}

output "subnet_id" {
  value       = "${azurerm_subnet.module.id}"
  description = "Id of the subnet created"
}

output "resource_group_name" {
  value       = "${azurerm_resource_group.module.name}"
  description = "Id of the subnet created"
}
