module "haproxy" {
  source               = "./modules/haproxy"
  instance_name        = "${var.instance_haproxy_name}"
  instance_flavor      = "${var.flavor}"
  instance_image       = "${var.image_1}"
  instance_keypair     = "${var.keypair}"
  network_id           = "${var.network}"
  private_key_path     = "${var.private_key_path}"
  instance_int_address = "${var.instance_haproxy_ip}"
}

module "web1" {
  source               = "./modules/webserver01"
  instance_name        = "${var.instance_web1_name}"
  instance_flavor      = "${var.flavor}"
  instance_image       = "${var.image_1}"
  instance_keypair     = "${var.keypair}"
  network_id           = "${var.network}"
  private_key_path     = "${var.private_key_path}"
  instance_int_address = "${var.instance_web1_ip}"
     }

module "web2" {
  source               = "./modules/webserver02"
  instance_name        = "${var.instance_web2_name}"
  instance_flavor      = "${var.flavor}"
  instance_image       = "${var.image_2}"
  instance_keypair     = "${var.keypair}"
  network_id           = "${var.network}"
  private_key_path     = "${var.private_key_path}"
  instance_int_address = "${var.instance_web2_ip}"
}
output "instance_haproxy_name" {
  value       = "${module.haproxy.instance_haproxy_name}"
  description = "openstack instance name"
}

output "instance_haproxy_floating_ip" {
  value       = "${module.haproxy.instance_haproxy_floating_ip}"
  description = "openstack instance floating ip"
}

output "instance_web1_name" {
  value       = "${module.web1.instance_web1_name}"
  description = "openstack instance name"
}

output "instance_web1_floating_ip" {
  value       = "${module.web1.instance_web1_floating_ip}"
  description = "openstack instance floating ip"
}

output "instance_web2_name" {
  value       = "${module.web2.instance_web2_name}"
  description = "openstack instance name"
     }

output "instance_web2_floating_ip" {
  value       = "${module.web2.instance_web2_floating_ip}"
  description = "openstack instance floating ip"
     }
