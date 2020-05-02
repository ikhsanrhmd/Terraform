variable "instance_int_address" {
  description = "The name to use for all the cluster resources"
  type        = string
}
variable "instance_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}

variable "instance_flavor" {
  description = "instance flavor"
  type        = string
}

variable "instance_image" {
  description = "instance image"
  type        = string
}


variable "instance_keypair" {
  description = "instance keypair"
  type        = string
}

variable "network_id" {
  description = "network id"
  type        = string
}

variable "private_key_path" {
  description = "private key path"
  type        = string
}

