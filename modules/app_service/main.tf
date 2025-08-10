resource "random_string" "suffix" {
  length  = 6
  upper   = false
  number  = true
  special = false
}

resource "azurerm_app_service_plan" "asp" {
  name                = "appserviceplan-${random_string.suffix.result}"
  location            = var.location
  resource_group_name = var.resource_group

  sku_name = "F1"
  os_type  = "Windows"
}

resource "azurerm_app_service" "app" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group
  app_service_plan_id = azurerm_app_service_plan.asp.id

  site_config {
    always_on = true
  }

  identity {
    type = "SystemAssigned"
  }