provider "vsphere" {
  user           = var.vsphere_username
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = var.datacenter_name
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.network_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "Win2019-Template" {
  name          = "Win2019-Template"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "Win10Pro-Template" {
  name          = "Win10Pro-Template"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "CentOS8-Template" {
  name          = "CentOS8-Template"
  datacenter_id = data.vsphere_datacenter.dc.id
}