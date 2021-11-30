source "nutanix" "windows" {
  nutanix_username = "${var.PC_USER}"
  nutanix_password = "${var.PC_PASS}"
  nutanix_endpoint = "${var.PC_ENDPOINT}"
  nutanix_insecure = var.nutanix_insecure
  cluster          = var.nutanix_cluster
  
  vm_disks {
      image_type = "ISO_IMAGE"
      source_image_name = "15842c26-0e66-472b-9549-3e9c75e81d50"
  }

  vm_disks {
      image_type = "ISO_IMAGE"
      source_image_name = "861afb4c-ae57-4810-a469-a3ad7c42473a"
  }

  vm_disks {
      disk_type = "DISK"
      disk_size_gb = 40
  }

  vm_nics {
    subnet_name       = var.nutanix_subnet
  }
    
  cd_files         = ["scripts/gui/autounattend.xml","scripts/win-update.ps1"]
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
