resource "openstack_compute_instance_v2" "instance"  { 
  count           = var.total
  name            = "${var.name}${count.index}"
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
  provisioner "remote-exec" {
    connection {
      host     = element(openstack_networking_floatingip_v2.floating_ip.*.address, count.index)
      type     = "ssh"
      user     = "ubuntu"
      private_key = file("/latihan/3/id_rsa")
    }

    inline = [
      "sudo apt-get -y update",
      "sudo apt-get -y install nginx",
      "sudo service nginx start",
      "echo 'ikhsanrhmd-WEBSERVER-0${count.index + 1}' | sudo tee /var/www/html/index.html"
    ]
  }
}


output "instance-name" {
  value       = openstack_compute_instance_v2.instance.*.name
  description = "openstack instance name"
}

output "instance-floating-ip" {
  value       = openstack_networking_floatingip_v2.floating_ip.*.address
  description = "openstack instance floating ip"
}
