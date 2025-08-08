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
  default = "sqladminuser"
}

variable "sql_admin_password" {
  type      = string
  sensitive = true
}

variable "sql_sku_name" {
  description = "SQL Database SKU (pricing tier)"
  type        = string
}