variable "instance_db_name" {
  default = "ikhsanrhmd-wordpress-db"
}

variable "instance_db_ip" {
  default = "10.35.35.120"
}

variable "mysql_host" {
  default = "10.35.35.120"
}

variable "mysql_port" {
  default = "3306"
}

variable "mysql_username" {
  default = "user_db"
}

variable "mysql_password" {
  default = "rahasia"
}

variable "mysql_database" {
  default = "wordpress"
}

variable "docker_container_name" {
  default = "ikhsanrhmd-wordpress"
}

variable "image" {
  default = "ubuntu-18.04-server-cloudimg-amd64"
}

variable "private_key_path" {
  default = "./file/id_rsa"
}

variable "flavor" {
  default = "ns.2-2-20"
}

variable "keypair" {
  default = "pubkey"
}

variable "network" {
  default = "5e5f46f2-d820-4119-b53d-c732ccd7a3e4"
}

