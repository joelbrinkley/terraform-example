variable "name" {}
variable "location" {}
variable "vnet_address_spacing" {
  type        = "string"
  description = ""
}

variable "subnet_address_prefixes" {
  type        = "string"
  description = ""
}

locals {
  module_name = "${var.name}-networking"
}
