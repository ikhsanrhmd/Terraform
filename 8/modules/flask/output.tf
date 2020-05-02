output "docker_container_name" {
  value       = "${docker_container.nolsatu_flask_mysql.*.name}"
  description = "Docker Container Name"
}
