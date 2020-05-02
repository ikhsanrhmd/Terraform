variable "total" {
 default = 2 
}

variable "name" {
  default = "ikhsanrhmd-WEBSERVER-0"
}

variable "image" {
  default = "ubuntu-18.04-server-cloudimg-amd64"
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
