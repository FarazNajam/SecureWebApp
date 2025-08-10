variable "location" {
  type = string
}

variable "resource_group" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "key_vault_name" {
  type = string
}

variable "sqldb_name" {
  type = string
}

variable "sqlserver_name" {
  type = string
}


variable "sql_admin_username" {
  type    = string
}

variable "sql_admin_password" {
  type      = string
  sensitive = true
}

variable "sql_sku_name" {
  description = "SQL Database SKU (pricing tier)"
  type        = string
}

variable "key_vault_id" {
  default = "/subscriptions/87d588f2-2685-46b9-a3d0-f7decd656498/resourceGroups/azkeyvaultRG8531/providers/Microsoft.KeyVault/vaults/azkeyvaultrg8531"
}
