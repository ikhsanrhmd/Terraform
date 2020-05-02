resource "docker_image" "httpd"{
  name = "httpd"
}

resource "docker_container" "httpd"{
  name = "ikhsanrhmd-nginx01"
 image = docker_image.httpd.latest

 ports{
   internal = 80
   external = 8181
}

  upload {
   content = file("./file/index.html")
   file = "/usr/local/apache2/htdocs/index.html"
}
}

