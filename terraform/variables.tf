variable "vsphere_username" {
	description = "vSphere user account"
	type = string
}

variable "vsphere_password" {
	description = "Password for vSphere user account"
	type = string
}

variable "vsphere_server" {
	description = "IP address or FQDN of vSphere server"
	type = string
	default = "" #UPDATE
}

variable "datacenter_name" {
	description = "Datacenter Name to deploy VM resources to within vSphere"
	type = string
	default = "" #UPDATE
}

variable "datastore_name" {
	description = "Name of Datastore where VM resources will be saved to"
	type = string
	default = "" #UPDATE
}

variable "network_name" {
	description = "Network that VM resources will be connected to (i.e.: vSwitch)"
	type = string
	default = "" #UPDATE
}

variable "cluster_name" {
	description = "Name of Cluster in vSphere where VM resources will be deployed to"
	type = string
	default = "" #UPDATE
}

variable "windows-2019" {
	description = "Predefined values for deploying multiple Windows Server 2016 VM's with different requirements - see terraform.tfvars"
	type = list
	default = [ ]
}

variable "windows-10" {
	description = "Predefined values for deploying multiple Windows 10 VM's with diffierent requirements - see terraform.tfvars"
	type = list
	default = [ ]
}

variable "centos8" {
	description = "Predefined values for deploying multiple CentOS 8 VM's with different requirements - see terraform.tfvars"
	type = list
	default = [ ]
}