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

module "app_service" {
  source          = "../../modules/app_service"
  app_service_name = "staging-appservice"
  location        = var.location
  resource_group  = azurerm_resource_group.rg.name  # pass created RG name
  app_settings    = {
    "KEYVAULT_URI" = module.key_vault.key_vault_uri
  }
}

module "key_vault" {
  source          = "../../modules/key_vault"
  key_vault_name  = "${var.key_vault_name}-${random_string.suffix.result}-plan"
  location        = var.location
  resource_group = azurerm_resource_group.rg.name  # pass created RG name
  tenant_id       = var.tenant_id
  object_id       = module.app_service.app_identity_id
}

module "sql" {
  source              = "./modules/sql"
  name                = var.name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sql_admin_username  = var.sql_admin_username
  sql_admin_password  = var.sql_admin_password
  sku_name            = var.sql_sku_name
  max_size_gb         = 10
  zone_redundant      = false
  read_scale          = "Disabled"
}


