#Virtual Machine Settings
vm_name                     = "Win10Pro-Template"
vm_guestos                  = "windows9_64Guest"
vm_cpus                     = "1"
vm_cpucores                 = "4"
vm_ram                      = "4096"
vm_disk_controller          = ["lsilogic-sas"]
vm_disk_size                = "61440"
vm_network                  = "VM Network"
vm_nic                      = "e1000e"
vm_notes                    = "AttackLab-Lite - Windows 10 Pro Template - {{ isotime }}"
vm_cdrom_type               = "sata"

#WinRM Communicator Authentication; based on Autounattend.xml file
builder_username            = "Administrator"
builder_password            = "P@ssW0rd1!"

#ISO URL (https://gist.github.com/mndambuki/35172b6485e40a42eea44cb2bd89a214) - Windows 10 Enterprise 1909
#os_iso_url                  = "https://software-download.microsoft.com/download/pr/18362.30.190401-1528.19h1_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
#os_iso_checksum             = "ab4862ba7d1644c27f27516d24cb21e6b39234eb3301e5f1fb365a78b22f79b3"

#Path to Windows 10 ISO on VM Host
os_iso_path                 = "[Datastore] ISO/Win10_21H1_English_x64.iso"
os_iso_checksum             = ""

#Enable SSH on ESXi host and use WinSCP to browse to "/vmimages/tools-isoimages" and download "windows.iso" from there, then upload to datastore
vmtools_iso_path            = "[Datastore] vmtools/windows.iso"