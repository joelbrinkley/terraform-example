output "azure_storage_account" {
    value = "${azurerm_storage_account.terraform_state.id}"
}