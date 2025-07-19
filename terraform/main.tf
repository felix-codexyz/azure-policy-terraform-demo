terraform {
       required_providers {
         azurerm = {
           source  = "hashicorp/azurerm"
           version = "~>3.0"
         }
       }
       backend "remote" {
         organization = var.tf_organization
         workspaces {
           name = var.tf_storage_workspace
         }
       }
     }

     provider "azurerm" {
       features {}
     }

     module "storage_account" {
       source                   = "./modules/storage-account"
       resource_group_name      = var.resource_group_name
       storage_account_name     = var.storage_account_name
       location                 = var.location
       account_tier             = var.account_tier
       account_replication_type = var.account_replication_type
     }