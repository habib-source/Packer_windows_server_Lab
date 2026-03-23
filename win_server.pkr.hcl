source "qemu" "win" {
  iso_url           = "./drive/win.iso"
  iso_checksum      = "none"
  output_directory  = "qemu"
  headless          = false
  shutdown_command  = "shutdown /s /t 10 /f /d p:4:1 /c Packer_Provisioning_Shutdown"
  disk_size         = "50000M"
  cpus              = 4
  memory            = 8000
  format            = "qcow2"
  accelerator       = "kvm"
  ssh_username      = "admin"
  ssh_password      = "admin"
  ssh_timeout       = "2000m"
  communicator      = "ssh"
  vm_name           = "Win_server_lab.qcow2"
  net_device        = "virtio-net"
  disk_interface    = "virtio"
  floppy_files      = ["./scripts/Autounattend.xml", "./scripts/pwsh-default.ps1"]
  qemuargs = [
    [ "-drive", "file=./drive/virtio.iso,media=cdrom,index=2" ],
    [ "-drive", "file=./qemu/Win_server_lab.qcow2,if=virtio,format=qcow2,index=0" ],
    [ "-drive", "file=./drive/win.iso,media=cdrom,index=1" ],
    ["-boot", "menu=on,once=d"],
    ["-cpu", "host"]
  ]
}

build {
  name = "WinServerLab"
  sources = ["source.qemu.win"]
}
