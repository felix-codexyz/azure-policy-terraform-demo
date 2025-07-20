variable "tf_organization" {
       description = "Terraform Cloud organization name"
       type        = string
     }

     variable "tf_storage_workspace" {
       description = "Terraform Cloud workspace for storage deployment"
       type        = string
     }

     variable "tf_policy_workspace" {
       description = "The name of the Terraform Cloud workspace for policies"
       type       = string
    }    

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