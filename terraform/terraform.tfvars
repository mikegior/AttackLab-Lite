# Windows Server 2019 (DC, General Purpose)
windows-2019 = [
   {
		vm_name = "LABDC01"
		folder = "AD Attack Lab"
		vcpu = "2"
		memory = "4096"
		admin_password = "P@ssW0rd1!"
		ipv4_address = "192.168.50.200"
		ipv4_gateway = "192.168.50.1"
		dns_server_list = ["127.0.0.1","192.168.50.1"]
    },
    {
		vm_name = "LABSVR01"
		folder = "AD Attack Lab"
		vcpu = "2"
		memory = "4096"
		admin_password = "P@ssW0rd1!"
		ipv4_address = "192.168.50.100"
		ipv4_gateway = "192.168.50.1"
		dns_server_list = ["192.168.50.200","192.168.50.1"]
    }
]

# Windows 10 Endpoints
windows-10 = [
    {
		vm_name = "WIN10LAB-01"
		folder = "AD Attack Lab"
		vcpu = "4"
		memory = "4096"
		admin_password = "P@ssW0rd1!"
		ipv4_address = "192.168.50.50"
		ipv4_gateway = "192.168.50.1"
		dns_server_list = ["192.168.50.200","192.168.50.1"]
    },
    {
		vm_name = "WIN10LAB-02"
		folder = "AD Attack Lab"
		vcpu = "4"
		memory = "4096"
		admin_password = "P@ssW0rd1!"
		ipv4_address = "192.168.50.51"
		ipv4_gateway = "192.168.50.1"
		dns_server_list = ["192.168.50.200","192.168.50.1"]
    }
]

# CentOS 8 Server (ELK)
centos8 = [
    {
		vm_name = "LABELK01"
		folder = "AD Attack Lab"
		vcpu = "4"
		memory = "12000"
		ipv4_address = "192.168.50.10"
		ipv4_gateway = "192.168.50.1"
		dns_server_list = ["192.168.50.200","192.168.50.1"]
		dns_suffix_list = ["lab.local"]
		domain = "lab.local"
    }
]