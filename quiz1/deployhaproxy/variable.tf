variable "instance_haproxy_name" {
  default = "ikhsanrhmd-haproxy"
}

variable "instance_web1_name" {
  default = "ikhsanrhmd-webserver01"
}

variable "instance_web2_name" {
  default = "ikhsanrhmd-webserver02"
}

variable "instance_haproxy_ip" {
  default = "10.35.35.50"
}

variable "instance_web1_ip" {
  default = "10.35.35.51"
}

variable "instance_web2_ip" {
  default = "10.35.35.52"
}

variable "private_key_path"{
  default = "./file/id_rsa"
}

variable "image_1" {
  default = "ubuntu-18.04-server-cloudimg-amd64"
}

variable "image_2" {
  default = "CentOS-7-x86_64-GenericCloud-1802.qcow2"
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

