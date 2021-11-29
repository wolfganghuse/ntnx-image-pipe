source "nutanix" "centos" {
  nutanix_username = var.nutanix_username
  nutanix_password = var.nutanix_password
  nutanix_endpoint = var.nutanix_endpoint
  nutanix_insecure = var.nutanix_insecure
  cluster          = var.nutanix_cluster
  os_type           = "Linux"
  
  vm_disks {
      disk_type = "IMAGE"
      source_image_name = "Centos84"
      disk_size_gb = 40
  }

  cd_files          = ["scripts/cleanup.ps1"]
  subnet_name       = var.nutanix_subnet
  image_name        ="centos8-{{isotime `Jan-_2-15:04:05`}}"
  user_data         = var.nutanix_user_data
  shutdown_command  = "echo 'packer' | sudo -S shutdown -P now"
  shutdown_timeout = "2m"
  ssh_password     = "packer"
  ssh_username     = "centos"
}

source "nutanix" "centos-iso" {
  nutanix_username = var.nutanix_username
  nutanix_password = var.nutanix_password
  nutanix_endpoint = var.nutanix_endpoint
  nutanix_insecure = var.nutanix_insecure
  cluster          = var.nutanix_cluster

  vm_disks {
      disk_type = "CDROM"
      source_image_name = "CentOS-7-x86_64-Minimal-2009.iso"
  }

  vm_disks {
      disk_type = "DISK"
      disk_size_gb = 40
  }

  os_type           = "Linux"
  subnet_name       = var.nutanix_subnet
  image_name        ="centos7-{{isotime `Jan-_2-15:04:05`}}"
  shutdown_command  = "echo 'packer' | sudo -S shutdown -P now"
  shutdown_timeout  = "2m"
  ssh_password      = "packer"
  ssh_username      = "root"
  vnc_user          = var.vnc_user
  vnc_password      = var.vnc_password
  boot_wait         = "0s"
  boot_command      = ["<tab> ks=http://iso-store.objects-clu1.ntnx.test/centos7-ks.cfg<enter><wait>"]
}

source "nutanix" "windows" {
  nutanix_username = var.nutanix_username
  nutanix_password = var.nutanix_password
  nutanix_endpoint = var.nutanix_endpoint
  nutanix_insecure = var.nutanix_insecure
  cluster          = var.nutanix_cluster
  
  vm_disks {
      disk_type = "CDROM"
      source_image_name = "Windows_Server_2016.ISO"
  }

  vm_disks {
      disk_type = "CDROM"
      source_image_name = "Nutanix-VirtIO-1.1.7"
  }

  vm_disks {
      disk_type = "DISK"
      disk_size_gb = 40
  }

  cd_files         = ["scripts/gui/autounattend.xml","scripts/win-update.ps1"]
  
  subnet_name       = var.nutanix_subnet
  image_name        ="win-{{isotime `Jan-_2-15:04:05`}}"
  shutdown_command  = "shutdown /s /t 10 /f /d p:4:1 /c \"Packer Shutdown\""
  shutdown_timeout  = "2m"
  cpu               = 2
  os_type           = "Windows"
  memory_mb         = "8192"
  communicator      = "winrm"
  winrm_port        = 5986
  winrm_insecure    = true
  winrm_use_ssl     = true
  winrm_timeout     = "30m"
  winrm_password    = "packer"
  winrm_username    = "Administrator"
}
