resource "docker_image" "nolsatu_flask_mysql" {
  name = "ilosaurus/nolsatu_flask_mysql"
}

resource "docker_container" "nolsatu_flask_mysql" {
  name = var.docker_container_name
  image = docker_image.nolsatu_flask_mysql.latest
  env = ["db_username=${var.mysql_username}", "db_password=${var.mysql_password}","db_host=${var.mysql_host}", "db_port=${var.mysql_port}", "db_database=${var.mysql_database}"]
  must_run="true"

  ports {
    internal = 5000
    external = 5005
  }
}

