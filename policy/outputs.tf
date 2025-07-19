output "policy_definition_id" {
       description = "ID of the Azure policy definition"
       value       = azurerm_policy_definition.restrict_location.id
     }

     output "policy_assignment_id" {
       description = "ID of the Azure policy assignment"
       value       = azurerm_subscription_policy_assignment.restrict_location_assignment.id
     }