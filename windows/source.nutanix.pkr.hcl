source "nutanix" "windows" {
  nutanix_username = "${var.PC_USER}"
  nutanix_password = "${var.PC_PASS}"
  nutanix_endpoint = "https://${var.PC_IP}:${var.PC_PORT}"
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
