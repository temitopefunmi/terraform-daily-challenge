output "storage_account_id" {
  value = azurerm_storage_account.staccount.id
}

output "primary_blob_endpoint" {
  value = azurerm_storage_account.staccount.primary_blob_endpoint
}