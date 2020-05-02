resource "openstack_compute_instance_v2" "instance" {
  name            = var.name
  image_name      = var.image
  flavor_name     = var.flavor
  key_pair        = var.keypair
  security_groups = ["default"]
  network {
    uuid = var.network
  }
}

resource "openstack_networking_floatingip_v2" "floating_ip" {
  pool = "extnet"
}

resource "openstack_compute_floatingip_associate_v2" "floating_ip" {
  floating_ip = openstack_networking_floatingip_v2.floating_ip.address
  instance_id = openstack_compute_instance_v2.instance.id
}
