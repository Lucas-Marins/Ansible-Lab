terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.83.0"
    }
  }
}

provider "azurerm" {
  features{

  }
}


resource "azurerm_resource_group" "this" {
  name = format("rg-%s", var.resource_group_name)
  location = var.location
  tags = var.tags
}

# 1 use count -> 
# 2 use for loop
# 3 use foreach

# lookup function

#storage account
resource "azurerm_storage_account" "storage" {
  # count = 2
  # name                     = format("%s%s", var.storage_account_name, count.index )  // simpletest0 ; simpletest1
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = var.environment_name == "prod" ? "premium" :  var.account_tier  
  account_replication_type = var.account_replication_type

  tags = var.tags
}

#keyvault resources
data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "example" {
  name                        = format("kv-%s-999", var.resource_group_name)
  location                    = var.location
  resource_group_name         = azurerm_resource_group.this.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

# Chamando o modulo app insight
module "insight" {
  source = "../modules/appinsight"
  resource_group_name = var.resource_group_name
  location = var.location

  tags = var.tags
}

# Chamando o modulo network
module "network" {
  source = "../modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = ["10.0.0.0/16"]

  subnets             = var.subnets 
  tags = var.tags
}

# Chamando o module compute
module "network" {
  source = "../modules/compute"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags = var.tags
}