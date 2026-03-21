terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "appname" {
  type = string
}

variable "subappname" {
  type = string
}

variable "location" {
  type = string
}

variable "iteration" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

module "rg" {
  source = "git::https://github.com/robinan11/TerraformRepo.git//terraform/modules/resource_group"

  appname    = var.appname
  subappname = var.subappname
  location   = var.location
  iteration  = var.iteration
  tags       = var.tags
}

output "resource_group_name" {
  value = module.rg.resource_group_name
}

output "resource_group_id" {
  value = module.rg.resource_group_id
}
