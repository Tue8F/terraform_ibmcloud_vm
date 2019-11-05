# Configure the IBM Cloud Provider
provider "ibm" {
  ibmcloud_api_key    = "${var.ibm_bmx_api_key}"
  iaas_classic_username = "${var.ibm_sl_username}"
  iaas_classic_api_key  = "${var.ibm_sl_api_key}"
}
data "ibm_compute_ssh_key" "key_1" {
  label      = "Input your SSH Key Label in IBM Cloud"
}

# Create a virtual server with the SSH key
resource "ibm_compute_vm_instance" "test_1" {
  ssh_key_ids       = ["${data.ibm_compute_ssh_key.key_1.id}"]
  os_reference_code = "CENTOS_6_64"
  datacenter        = "seo01"
  network_speed     = 10
  cores             = 1
  memory            = 1024
  hostname          = "test"
  domain            = "abc.com"
}
