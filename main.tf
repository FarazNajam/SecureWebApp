terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group
  location = var.location
}

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  number  = true
  special = false
}


module "app_service" {
  source          = "./modules/app_service"
  app_service_name = "staging-appservice"
  location        = var.location
  resource_group  = azurerm_resource_group.rg.name  # pass created RG name
  app_settings    = {
    "KEYVAULT_URI" = var.key_vault_uri
  }
}

# module "key_vault" {
#   source          = "./modules/key_vault"
#   key_vault_name  = "${var.key_vault_name}-${random_string.suffix.result}-plan"
#   location        = var.location
#   resource_group = azurerm_resource_group.rg.name  # pass created RG name
#   tenant_id       = var.tenant_id
#   object_id       = module.app_service.app_identity_id
# }

module "sql" {
  source              = "./modules/sql"
  sqldb_name          = var.sqldb_name
  sqlserver_name      = var.sqlserver_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sql_admin_username  = data.azurerm_key_vault_secret.sql_admin_username.value  
  sql_admin_password  = data.azurerm_key_vault_secret.sql_admin_password.value
  sql_sku_name        = var.sql_sku_name
  max_size_gb         = 10
  zone_redundant      = false
  read_scale          = false
}

data "azurerm_key_vault_secret" "sql_admin_password" {
  name         = "SqlAdminPassword"   # the name you gave the secret in Key Vault
  key_vault_id = var.key_vault_id
}

data "azurerm_key_vault_secret" "sql_admin_username" {
  name         = "SqlAdminUsername"
  key_vault_id = var.key_vault_id
}

