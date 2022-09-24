terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.24.0"
    }
  }
}

provider "azurerm" {

 features {
  virtual_machine_scale_set {
      force_delete                  = false
      roll_instances_when_required  = true
      scale_to_zero_before_deletion = true
    }
   
 }
}

resource "azurerm_resource_group" "example" {
  name     = "devlab-vmss-rg"
  location = "East US2"
}