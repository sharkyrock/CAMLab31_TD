#####################################################################
##
##      Created 9/11/19 by ucdpadmin. for project2
##
#####################################################################

## REFERENCE {"vm_network":{"type": "vsphere_reference_network"}}

terraform {
  required_version = "> 0.8.0"
}

provider "vsphere" {
  user           = "${var.user}"
  password       = "${var.password}"
  vsphere_server = "${var.vsphere_server}"

  allow_unverified_ssl = "${var.allow_unverified_ssl}"
  version = "~> 1.2"
}


data "vsphere_virtual_machine" "app_server_template" {
  name          = "${var.app_server_template_name}"
  datacenter_id = "${data.vsphere_datacenter.app_server_datacenter.id}"
}

data "vsphere_virtual_machine" "db_server_template" {
  name          = "${var.db_server_template_name}"
  datacenter_id = "${data.vsphere_datacenter.db_server_datacenter.id}"
}

data "vsphere_datacenter" "app_server_datacenter" {
  name = "${var.app_server_datacenter_name}"
}

data "vsphere_datacenter" "db_server_datacenter" {
  name = "${var.db_server_datacenter_name}"
}

data "vsphere_datastore" "app_server_datastore" {
  name          = "${var.app_server_datastore_name}"
  datacenter_id = "${data.vsphere_datacenter.app_server_datacenter.id}"
}

data "vsphere_datastore" "db_server_datastore" {
  name          = "${var.db_server_datastore_name}"
  datacenter_id = "${data.vsphere_datacenter.db_server_datacenter.id}"
}

data "vsphere_network" "network" {
  name          = "${var.network_network_name}"
  datacenter_id = "${data.vsphere_datacenter.app_server_datacenter.id}"
}

resource "vsphere_virtual_machine" "app_server" {
  name          = "${var.app_server_name}"
  datastore_id  = "${data.vsphere_datastore.app_server_datastore.id}"
  num_cpus      = "${var.app_server_number_of_vcpu}"
  memory        = "${var.app_server_memory}"
  guest_id = "${data.vsphere_virtual_machine.app_server_template.guest_id}"
  resource_pool_id = "${var.app_server_resource_pool}"
  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }
  clone {
    template_uuid = "${data.vsphere_virtual_machine.app_server_template.id}"
  }
  disk {
    name = "${var.app_server_disk_name}"
    size = "${var.app_server_disk_size}"
  }
}

resource "vsphere_virtual_machine" "db_server" {
  name          = "${var.db_server_name}"
  datastore_id  = "${data.vsphere_datastore.db_server_datastore.id}"
  num_cpus      = "${var.db_server_number_of_vcpu}"
  memory        = "${var.db_server_memory}"
  guest_id = "${data.vsphere_virtual_machine.db_server_template.guest_id}"
  resource_pool_id = "${var.app_server_resource_pool}"
  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }
  clone {
    template_uuid = "${data.vsphere_virtual_machine.db_server_template.id}"
  }
  disk {
    name = "${var.db_server_disk_name}"
    size = "${var.db_server_disk_size}"
  }
}