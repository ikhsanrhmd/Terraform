resource "openstack_compute_instance_v2" "instance"  {
  name            = var.instance_name
  image_name      = var.instance_image
  flavor_name     = var.instance_flavor
  key_pair        = var.instance_keypair
  security_groups = ["default"]
  network {
    uuid = var.network_id
    fixed_ip_v4 = var.instance_int_address
  }
}

resource "openstack_networking_floatingip_v2" "floating_ip" {
  pool  = "extnet"
}

resource "openstack_compute_floatingip_associate_v2" "floating_ip" {
  floating_ip = openstack_networking_floatingip_v2.floating_ip.address
  instance_id = openstack_compute_instance_v2.instance.id
  provisioner "remote-exec" {
    connection {
      host     = openstack_networking_floatingip_v2.floating_ip.address
      type     = "ssh"
      user     = "centos"
      private_key = file(var.private_key_path)
    }

    inline = [
      "sudo yum -y update",
      "sudo yum -y install httpd",
      "sudo service httpd start",
      "echo 'IKHSANRHMD-WEBSERVER-02' | sudo tee /var/www/html/index.html"
    ]
  }
}

