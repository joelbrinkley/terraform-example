variable "location" {
    description = "The location for the staging environment"
    default = "East US"
}

variable "environment"{
    default = "pre-prod"
}

variable "rabbitmq_username" {}

variable "rabbitmq_password" {}