variable "name" {}
variable "location" {}

variable "vnet_address_spacing" {
  //   default     = ["10.0.0.0/16"]
  type        = "list"
  description = ""
}

variable "subnet_address_prefixes" {
  //   default     = ["10.0.2.0/24"]
  type        = "list"
  description = ""
}

locals {
  module_name = "${var.name}-networking"
}
