variable "vnet_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "subnets" {
  type = list(object({
    name           = string
    address_prefix = string
  }))
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

variable "name" {
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