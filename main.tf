terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.45"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "resource_group_name" {
    default = "demos"
    type = string
    description = "Resource group where the resource will be created"
}

variable "location" {
    default = "brazilsouth"
    description = "Location of Azure resources"
    type = string
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}