resource "vsphere_virtual_machine" "centos8" {
  count		         = length(var.centos8)
 
  name             = lookup(var.centos8[count.index], "vm_name")
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  
  num_cpus         = lookup(var.centos8[count.index], "vcpu")
  memory           = lookup(var.centos8[count.index], "memory")

  guest_id         = data.vsphere_virtual_machine.CentOS8-Template.guest_id
  scsi_type        = data.vsphere_virtual_machine.CentOS8-Template.scsi_type
  firmware         = data.vsphere_virtual_machine.CentOS8-Template.firmware
  
  folder           = lookup(var.centos8[count.index], "folder")

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.CentOS8-Template.network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.CentOS8-Template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.CentOS8-Template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.CentOS8-Template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.CentOS8-Template.id
    
    customize {
      timeout = 20
      linux_options {
        host_name = lookup(var.centos8[count.index], "vm_name")
        domain    = lookup(var.centos8[count.index], "domain")
      }
      
      network_interface {
        ipv4_address = lookup(var.centos8[count.index], "ipv4_address")
        ipv4_netmask = 24
      }

      ipv4_gateway    = lookup(var.centos8[count.index], "ipv4_gateway")
      dns_server_list = lookup(var.centos8[count.index], "dns_server_list")
      dns_suffix_list = lookup(var.centos8[count.index], "dns_suffix_list")
    }
  }
}
