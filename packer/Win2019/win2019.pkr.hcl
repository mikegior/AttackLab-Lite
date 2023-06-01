#################
# PACKER PLUGINS
#################

packer {
    required_version = ">= 1.8.3"

    required_plugins {
        vmware = {
            version = ">= 1.0.8"
            source  = "github.com/hashicorp/vsphere"
        }
    }
}

####################
# VSPHERE VARIABLES
####################

variable "vsphere_ip" {
    type = string
    description = "vSphere Server IP Address or Hostname"
    default = ""
}

variable "vsphere_username" {
    type = string
    description = "vSphere Username"
    default = ""
}

variable "vsphere_password" {
    type = string
    description = "vSphere Password"
    default = ""
    sensitive = true
}

variable "vsphere_dc" {
    type = string
    description = "Datacenter in vSphere Instance"
    default = ""
}

variable "vsphere_datastore" {
    type = string
    description = "Datastore to Reference"
    default = ""
}

variable "vsphere_cluster" {
    type = string
    description = "Cluster in vSphere Instance"
    default = ""
}

variable "vsphere_folder" {
    type = string
    description = "Destination Folder to Store Template"
    default = ""
}

variable "vcenter_host" {
    type = string
    description = "ESXi Host where VM will be created"
    default = ""
}

###############
# VM VARIABLES
###############

variable "vm_name" {
    type = string
    description = "Name of VM Template"
    default = ""
}

variable "vm_guestos" {
    type = string
    description = "VM Guest OS Type"
    default = ""
}

variable "vm_firmware" {
    type = string
    description = "Firmware type for the VM; i.e.: 'efi' or 'bios'"
    default = ""
}

variable "vm_cpus" {
    type = number
    description = "Number of vCPU's for VM"
}

variable "vm_cpucores" {
    type = number
    description = "Number of vCPU Cores for VM"
}

variable "vm_ram" {
    type = number
    description = "Amount of RAM for VM"
}

variable "vm_cdrom_type" {
    type = string
    description = "CDROM Type for VM"
    default = ""
}

variable "vm_disk_controller" {
    type = list(string)
    description = "VM Disk Controller"
}

variable "vm_disk_size" {
    type = number
    description = "Desired Disk Size for VM"
}

variable "vm_network" {
    type = string
    description = "Desired Virtual Network to Connect VM To"
    default = ""
}

variable "vm_nic" {
    type = string
    description = "VM Network Interface Card Type"
    default = ""
}

variable "builder_username" {
    type = string
    description = "VM Guest Username to Build With"
    default = ""
}

variable "builder_password" {
    type = string
    description = "VM Guest User's Password to Authenticate With"
    default = ""
}

variable "os_iso_path" {
    type = string
    description = "Path to ISO on Host's Datastore"
    default = ""
}

variable "os_iso_url" {
    type = string
    description = "URL to ISO File for Packer to Download"
    default = ""
}

variable "os_iso_checksum" {
    type = string
    description = "SHA256 Checksum of the Target ISO File"
    default = ""
}

variable "vmtools_iso_path" {
    type = string
    description = "Path to ISO of Windows VMTools on Host's Datastore"
    default = ""
}

variable "vm_notes" {
    type = string
    description = "Notes for VM Template"
    default = ""
}

#########
# SOURCE
#########

source "vsphere-iso" "win2019" {
    vcenter_server       = var.vsphere_ip
    username             = var.vsphere_username
    password             = var.vsphere_password
    insecure_connection  = true

    datacenter           = var.vsphere_dc
    datastore            = var.vsphere_datastore
    cluster              = var.vsphere_cluster
    folder               = var.vsphere_folder
    host                 = var.vcenter_host

    vm_name              = var.vm_name
    guest_os_type        = var.vm_guestos
    firmware		     = var.vm_firmware
    CPUs                 = var.vm_cpus
    cpu_cores            = var.vm_cpucores
    RAM                  = var.vm_ram
    floppy_files         = [
        "../scripts/Install-VMTools.bat",
        "../scripts/WinRM-Config.ps1",
        "autounattend.xml"
    ]
    cdrom_type		     = var.vm_cdrom_type
    disk_controller_type = var.vm_disk_controller
    
    storage {
        disk_size             = var.vm_disk_size
        disk_thin_provisioned = true
    }

    network_adapters {
        network      = var.vm_network
        network_card = var.vm_nic
    }

    notes               = var.vm_notes
    convert_to_template = true

    communicator      = "winrm"
    winrm_username    = var.builder_username
    winrm_password    = var.builder_password
    winrm_timeout     = "3h"

    iso_paths         = [
        var.os_iso_path,
        var.vmtools_iso_path
    ]

    #iso_url	          = var.os_iso_url
    iso_checksum      = var.os_iso_checksum

    remove_cdrom      = true
}

########
# BUILD
########

build {
    sources = ["source.vsphere-iso.win2019"]

    provisioner "windows-shell" {
        inline = ["shutdown /s /t 5 /f /d p:4:1 /c \"Packer Shutdown\""]
    }
}
