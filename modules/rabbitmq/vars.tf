variable "name" {}
variable "location" {}
variable "cluster_size" {
    default = 2
    description = "Number of virtual machines for the rabbitmq cluster."
}
variable "subnet_id" {
    description= "The subnet id for the virtual machines"
}
variable "vm_size" {
  default     = "Standard_A0"
  type        = "string"
  description = ""
}
#az vm image list --output table
variable "os" {
  type        = "string"
  description = "The Marketplace image information in the following format: Offer:Publisher:Sku:Version"
}

variable "disk_os_sku" {
  default     = "Standard_LRS"
  type        = "string"
  description = ""
}

variable "disk_data_sku" {
  default     = "Standard_LRS"
  type        = "string"
  description = ""
}

variable "disk_data_size_gb" {
  default     = 128
  type        = "string"
  description = ""
}

variable "delete_os_disk_on_termination" {
  default     = false
  type        = "string"
  description = ""
}

variable "delete_data_disks_on_termination" {
  default     = false
  type        = "string"
  description = ""
}

variable "admin_username" {

}

variable "admin_password" {

}
