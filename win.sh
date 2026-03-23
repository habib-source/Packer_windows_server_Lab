#!/bin/bash
exec qemu-system-x86_64 -enable-kvm \
        -cpu host \
	-drive file=./qemu/Win_server_lab.qcow2,if=virtio,format=qcow2 \
	-boot menu=on\
	-m 8G \
        -smp 7 \
        -name "Windows Server 2025" \
	-spice port=5090,disable-ticketing=on \
        -nic bridge,br=br0,model=virtio-net-pci,mac=52:54:01:12:34:87 \
        $@
