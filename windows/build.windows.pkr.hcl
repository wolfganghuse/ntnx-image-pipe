build {
    sources = [
        "source.nutanix.windows"
    ]
  }

provisioner "powershell" {
    scripts = ["scripts/win-update.ps1"]
    pause_before = "2m"
}
provisioner "windows-restart" {
    restart_timeout = "30m"
}
