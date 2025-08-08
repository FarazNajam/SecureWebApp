resource "azurerm_key_vault" "kv" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
  purge_protection_enabled    = false
  soft_delete_retention_days = 7

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id  # typically the app service's principal or admin
    key_permissions = [
      "Get", "List"
    ]
    secret_permissions = [
      "Get", "List"
    ]
  }
}
