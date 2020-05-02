resource "openstack_compute_instance_v2" "instance" {
  name = "ikhsanrhmd-INSTANCE00"
  image_name       = "ubuntu-18.04-server-cloudimg-amd64"
  flavor_name      = "ns.2-2-20"
  key_pair         = "pubkey"
  security_groups  = ["default"]
  network {
    uuid = "5e5f46f2-d820-4119-b53d-c732ccd7a3e4"
  }
}

resource "openstack_networking_floatingip_v2" "floating_ip" {
  pool = "extnet"
}

resource "openstack_compute_floatingip_associate_v2" "floating_ip" {
  floating_ip = openstack_networking_floatingip_v2.floating_ip.address
  instance_id = openstack_compute_instance_v2.instance.id
}
