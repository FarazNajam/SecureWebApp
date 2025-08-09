resource "azurerm_service_plan" "asp" {
  name                = "${var.app_service_name}-plan"
  location            = var.location
  resource_group_name = var.resource_group

  sku_name = "F1"     # e.g. "F1" for Free, "S1" for Standard Small, etc.
  os_type  = "Windows" # or "Linux"
}




resource "azurerm_app_service" "app" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group
  app_service_plan_id = azurerm_service_plan.asp.id

  site_config {
    always_on = true
  }

  identity {
    type = "SystemAssigned"
  }

  app_settings = {
  "KEYVAULT_SECRET_URI" = "@Microsoft.KeyVault(SecretUri=https://staging-kv.vault.azure.net/secrets/secret-name)"
}

}

#