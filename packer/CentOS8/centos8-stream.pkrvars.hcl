#Virtual Machine Settings
vm_name                     = "CentOS8-Template"
vm_guestos                  = "centos8_64Guest"
vm_firmware                 = "bios"
vm_cpus                     = "1"
vm_cpucores                 = "4"
vm_ram                      = "4096"
vm_disk_controller          = ["pvscsi"]
vm_disk_size                = "16384"
vm_network                  = "VM Network"
vm_nic                      = "vmxnet3"
vm_notes                    = "AttackLab-Lite - CentOS 8 Stream Image - {{ isotime }}"
vm_cdrom_type               = "sata"

#SSH Communicator Authentication
builder_username            = "root"
builder_password            = "P@ssW0rd1!"

#ISO URL - CentOS 8 Stream DVD (6/1/2023) - http://mirror.datto.com/CentOS/8-stream/isos/x86_64/
os_iso_url                  = "http://mirror.datto.com/CentOS/8-stream/isos/x86_64/CentOS-Stream-8-20230523.0-x86_64-dvd1.iso"
os_iso_checksum             = "9eccffc5384474a3f79d1538a4958325e622081cdbab58fd6c947d20fe2c9405"

#Path to OS ISO on VM Host's Datastore
#os_iso_path               = "[Datastore] ISO/CentOS-Stream-8-20230523.0-x86_64-dvd1.iso"
#os_iso_checksum           = "9eccffc5384474a3f79d1538a4958325e622081cdbab58fd6c947d20fe2c9405"
