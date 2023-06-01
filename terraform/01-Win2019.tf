resource "vsphere_virtual_machine" "windows-2019" {
  count		         = length(var.windows-2019)
  
  name             = lookup(var.windows-2019[count.index], "vm_name")
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  
  num_cpus         = lookup(var.windows-2019[count.index], "vcpu")
  memory           = lookup(var.windows-2019[count.index], "memory")

  guest_id         = data.vsphere_virtual_machine.Win2019-Template.guest_id
  scsi_type        = data.vsphere_virtual_machine.Win2019-Template.scsi_type
  firmware         = data.vsphere_virtual_machine.Win2019-Template.firmware
  
  folder           = lookup(var.windows-2019[count.index], "folder")

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.Win2019-Template.network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.Win2019-Template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.Win2019-Template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.Win2019-Template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.Win2019-Template.id
    
    customize {
      timeout = 20
      windows_options {
        computer_name    = lookup(var.windows-2019[count.index], "vm_name")
        admin_password   = lookup(var.windows-2019[count.index], "admin_password")
        auto_logon       = true
        auto_logon_count = 1
        time_zone        = 035

        #Download and execute ConfigureRemotingforAnsible (WinRM)
        run_once_command_list = [
          "powershell.exe [Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1 -Outfile C:\\WinRM_Ansible.ps1",
          "powershell.exe -ExecutionPolicy Bypass -File C:\\WinRM_Ansible.ps1"
        ]
      }
      
      network_interface {
        ipv4_address = lookup(var.windows-2019[count.index], "ipv4_address")
        ipv4_netmask = 24
      }

      ipv4_gateway    = lookup(var.windows-2019[count.index], "ipv4_gateway")
      dns_server_list = lookup(var.windows-2019[count.index], "dns_server_list")
    }
  }
}
