provider "openstack" {
  user_name   = "ikhsanrhmd"
  tenant_name = "ikhsanrhmd"
  password    = "iri7298isan"
  auth_url    = "http://lab1.nolsatu.id:5000"
  domain_name = "default"
}
provider "docker" {
  host = "tcp://10.35.35.20:2376/"
}
