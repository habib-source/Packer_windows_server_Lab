#!/bin/bash

if [ ! -d "media" ]; then
	mkdir drive
fi
if [ ! -e "./drive/virtio.iso" ]; then
	curl -L "https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso" --output "./drive/virtio.iso"
fi
if [ ! -e "./drive/win.iso" ]; then
	curl -L "https://go.microsoft.com/fwlink/?linkid=2345730&clcid=0x409&culture=en-us&country=us" --output "./drive/win.iso"
fi
PACKER_LOG=1 PACKER_GETTER_READ_TIMEOUT=500m packer build .
