variable "app_service_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group" {
  type = string
}

variable "app_settings" {
  type    = string
  default = https://azkeyvaultrg8531.vault.azure.net/
}

variable "key_vault_uri" {
  type = string
}

variable "app_service_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group" {
  type = string
}

variable "app_settings" {
  type    = map(string)
  default = {
    KEYVAULT_URI = "https://azkeyvaultrg8531.vault.azure.net/"
  }
}


variable "key_vault_uri" {
  type = string
}
