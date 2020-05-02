resource "openstack_compute_instance_v2" "instance"  { 
  count           = var.total
  name            = "${var.name}-${count.index}"
  image_name      = var.image
  flavor_name     = var.flavor
  key_pair        = var.keypair
  security_groups = ["default"]
  network {
    uuid = var.network
  }
}

resource "openstack_networking_floatingip_v2" "floating_ip" {
  count = var.total
  pool  = "extnet"
}

resource "openstack_compute_floatingip_associate_v2" "floating_ip" {
  count       = var.total
  floating_ip = element(openstack_networking_floatingip_v2.floating_ip.*.address, count.index)
  instance_id = element(openstack_compute_instance_v2.instance.*.id, count.index)
}
