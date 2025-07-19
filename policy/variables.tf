variable "tf_organization" {
       description = "Terraform Cloud organization name"
       type        = string
     }

     variable "tf_policy_workspace" {
       description = "Terraform Cloud workspace for policy assignment"
       type        = string
     }

     variable "policy_name" {
       description = "Name of the Azure policy definition"
       type        = string
       default     = "restrict-resource-location"
     }

     variable "policy_display_name" {
       description = "Display name of the Azure policy definition"
       type        = string
       default     = "Restrict Resource Location to East US"
     }

     variable "policy_assignment_name" {
       description = "Name of the Azure policy assignment"
       type        = string
       default     = "restrict-location-assignment"
     }

     variable "policy_assignment_description" {
       description = "Description of the Azure policy assignment"
       type        = string
       default     = "Assigns the policy to restrict resources to East US"
     }

     variable "policy_assignment_display_name" {
       description = "Display name of the Azure policy assignment"
       type        = string
       default     = "Restrict Location Assignment"
     }