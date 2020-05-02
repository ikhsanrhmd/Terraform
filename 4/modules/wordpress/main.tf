resource "openstack_compute_instance_v2" "instance" {
  name             = var.instance_name
  image_name       = var.instance_image
  flavor_name      = var.instance_flavor
  key_pair         = var.instance_keypair
  security_groups  = ["default"]
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
      user     = "ubuntu"
      private_key = file(var.private_key_path)
    }

    inline = [
      "sudo apt -y update",
      "sudo DEBIAN_FRONTEND=noninteractive apt -y upgrade && sudo  apt -y autoremove",
      "sudo sleep 10",
      "sudo apt -y install unzip zip wget",
      "sudo apt install -y apache2",
      "sudo apt install -y php7.2 php7.2-mysql libapache2-mod-php",
      "sudo apt -y install php libapache2-mod-php apache2 mariadb-client zip unzip wget",
      "sudo wget https://wordpress.org/latest.zip",
      "sudo unzip latest.zip",
      "sudo  mv wordpress/* /var/www/html/",
      "sudo mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php",
      "sudo rm -f /var/www/html/index.html",
      "sudo sed -i 's/database_name_here/${var.mysql_database}/g' /var/www/html/wp-config.php",
      "sudo sed -i 's/username_here/${var.mysql_username}/g' /var/www/html/wp-config.php",
      "sudo sed -i 's/password_here/${var.mysql_password}/g' /var/www/html/wp-config.php",
      "sudo sed -i 's/localhost/${var.mysql_host}/g' /var/www/html/wp-config.php"
    ]
  }
}
