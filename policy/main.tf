terraform {
       required_providers {
         azurerm = {
           source  = "hashicorp/azurerm"
           version = "~>3.0"
         }
       }
       terraform { 
  cloud { 
    
    organization = "felfun-spz-technologies-azure-platform" 

    workspaces { 
      name = "azure-policy-workspace" 
    } 
  } 
}
       terraform { 
  cloud { 
    
    organization = "felfun-spz-technologies-azure-platform" 

    workspaces { 
      name = "azure-policy-workspace" 
    } 
  } 
}
       terraform { 
  cloud { 
    
    organization = "felfun-spz-technologies-azure-platform" 

    workspaces { 
      name = "azure-policy-workspace" 
    } 
  } 
}
       terraform { 
  cloud { 
    
    organization = "felfun-spz-technologies-azure-platform" 

    workspaces { 
      name = "azure-policy-workspace" 
    } 
  } 
}
       terraform { 
  cloud { 
    
    organization = "felfun-spz-technologies-azure-platform" 

    workspaces { 
      name = "azure-policy-workspace" 
    } 
  } 
}
       }
     }

     provider "azurerm" {
       features {}
     }

     data "azurerm_subscription" "current" {}

     resource "azurerm_policy_definition" "restrict_location" {
       name         = var.policy_name
       display_name = var.policy_display_name
       policy_type  = "Custom"
       mode         = "All"
       policy_rule  = file("${path.module}/restrict-region-policy.json")
     }

     resource "azurerm_subscription_policy_assignment" "restrict_location_assignment" {
       name                 = var.policy_assignment_name
       subscription_id      = data.azurerm_subscription.current.id
       policy_definition_id = azurerm_policy_definition.restrict_location.id
       description          = var.policy_assignment_description
       display_name         = var.policy_assignment_display_name
     }