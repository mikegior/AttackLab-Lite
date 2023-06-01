#Virtual Machine Settings
vm_name                     = "Win2019-Template"
vm_guestos                  = "windows9Server64Guest"
vm_cpus                     = "1"
vm_cpucores                 = "4"
vm_ram                      = "4096"
vm_disk_controller          = ["lsilogic-sas"]
vm_disk_size                = "61440"
vm_network                  = "VM Network"
vm_nic                      = "e1000e"
vm_notes                    = "AttackLab-Lite - Windows Server 2019 Template - {{ isotime }}"
vm_cdrom_type               = "sata"

#WinRM Communicator Authentication; based on Autounattend.xml file
builder_username            = "Administrator"
builder_password            = "P@ssW0rd1!"

#ISO URL - Windows Server 2019 Evaluation
#os_iso_url                  = "https://software-download.microsoft.com/download/pr/17763.737.190906-2324.rs5_release_svc_refresh_SERVER_EVAL_x64FRE_en-us_1.iso"
#os_iso_checksum             = "549bca46c055157291be6c22a3aaaed8330e78ef4382c99ee82c896426a1cee1"

#Path to Windows 10 ISO on VM Host
os_iso_path                 = "Datastore] ISO/17763.737.190906-2324.rs5_release_svc_refresh_SERVER_EVAL_x64FRE_en-us_1.iso"
os_iso_checksum             = ""

#Enable SSH on ESXi host and use WinSCP to browse to "/vmimages/tools-isoimages" and download "windows.iso" from there, then upload to datastore
vmtools_iso_path            = "[Datastore] vmtools/windows.iso"