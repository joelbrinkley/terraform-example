module "linuxvm" "jb-test-linuxvm" {
  source                  = "../modules/linuxvm"
  location                = "${var.location}"
  name                    = "jb-test-linux"
  subnet_id               = "${module.networking.subnet_id}"
  os                      = "RedHat:RHEL:7.3:latest",
  admin_username          = "${var.linux_username}"
  admin_password          = "${var.linux_password}"
}
