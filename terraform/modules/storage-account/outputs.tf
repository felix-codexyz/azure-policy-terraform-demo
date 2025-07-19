output "storage_account_id" {
       description = "ID of the storage account"
       value       = azurerm_storage_account.storage.id
     }

     output "storage_account_name" {
       description = "Name of the storage account"
       value       = azurerm_storage_account.storage.name
     }