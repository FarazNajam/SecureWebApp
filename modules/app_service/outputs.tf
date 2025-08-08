output "app_service_id" {
  value = azurerm_app_service.app.id
}

output "app_service_default_hostname" {
  value = azurerm_app_service.app.default_site_hostname
}

output "app_identity_id" {
  value = azurerm_app_service.app.identity[0].principal_id
}
