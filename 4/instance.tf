module "wordpress" {
  source               = "./modules/wordpress"
  instance_name        = "${var.instance_web_name}"
  instance_flavor      = "${var.flavor}"
  instance_image       = "${var.image}"
  instance_keypair     = "${var.keypair}"
  network_id           = "${var.network}"
  private_key_path     = "${var.private_key_path}"
  mysql_host           = "${var.mysql_host}"
  mysql_username       = "${var.mysql_username}"
  mysql_password       = "${var.mysql_password}"
  mysql_database       = "${var.mysql_database}"
  instance_int_address = "${var.instance_web_ip}"
}

module "db" {
  source               = "./modules/db"
  instance_flavor      = "${var.flavor}"
  instance_image       = "${var.image}"
  instance_keypair     = "${var.keypair}"
  network_id           = "${var.network}"
  instance_name        = "${var.instance_db_name}"
  private_key_path     = "${var.private_key_path}"
  mysql_username       = "${var.mysql_username}"
  mysql_password       = "${var.mysql_password}"
  mysql_database       = "${var.mysql_database}"
  instance_int_address = "${var.instance_db_ip}"
}

output "instance_db_name" {
  value       = "${module.db.instance_db_name}"
  description = "openstack instance name"
}

output "instance_db_floating_ip" {
  value       = "${module.db.instance_db_floating_ip}"
  description = "openstack instance floating ip"
}

output "instance_wordpress_name" {
  value       = "${module.wordpress.instance_wordpress_name}"
  description = "openstack instance name"
}

output "instance_wordpress_floating_ip" {
  value       = "${module.wordpress.instance_wordpress_floating_ip}"
  description = "openstack instance floating ip"
}
