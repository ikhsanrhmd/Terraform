resource "docker_image" "wordpress" {
  name = "wordpress"
}

resource "docker_container" "wordpress" {
  name = var.docker_container_name
  image = docker_image.wordpress.latest
  env = ["WORDPRESS_DB_USER=${var.mysql_username}", "WORDPRESS_DB_PASSWORD=${var.mysql_password}","WORDPRESS_DB_HOST=${var.mysql_host}", "WORDPRESS_DB_NAME=${var.mysql_database}"]
  must_run="true"

  ports {
    internal = 80
    external = 8080
  }
}


