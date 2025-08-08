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
  default = {}
}
