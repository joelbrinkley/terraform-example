module "rabbitmq" "jb-test-rabbitmq" {
  source                  = "../modules/rabbitmq"
  location                = "${var.location}"
  name                    = "jb-test-rabbitmq"
  subnet_id               = "${module.networking.subnet_id}"
  os                      = "RedHat:RHEL:7.3:latest",
  admin_username          = "${var.rabbitmq_username}"
  admin_password          = "${var.rabbitmq_password}"
}
