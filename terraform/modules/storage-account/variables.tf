variable "resource_group_name" {
       description = "Name of the resource group"
       type        = string
     }

     variable "storage_account_name" {
       description = "Name of the storage account"
       type        = string
     }

     variable "location" {
       description = "Azure region for the storage account"
       type        = string
     }

     variable "account_tier" {
       description = "Tier of the storage account (Standard/Premium)"
       type        = string
       default     = "Standard"
     }

     variable "account_replication_type" {
       description = "Replication type for the storage account"
       type        = string
       default     = "LRS"
     }