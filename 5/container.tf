resource "docker_image" "nginx"{
  name = "nginx"
}

resource "docker_container" "nginx"{
  name = "ikhsanrhmd-nginx-01"
  image = docker_image.nginx.latest
}
