#!/bin/bash
# -append "root=/dev/sda2 rootfstype=ext4 elevator=deadline rootwait rw" \
# -append "root=/dev/mmcblk0p2 panic=1 rootwait rootfstype=ext4 rw" \
# -append "dwc_otg.lpm_enable=0 console=ttyAMA0,115200 console=tty0 elevator=deadline"
# -dtb bcm2710-rpi-3-b-plus.dtb \

sudo qemu-system-aarch64 \
  -kernel ./mnt/boot/vmlinuz \
  -initrd ./mnt/boot/initrd.img \
  -append "net.ifnames=0 dwc_otg.lpm_enable=0 console=ttyAMA0,115200 console=tty1 root=/dev/mmcblk0p2 rw rootfstype=ext4 elevator=deadline rootwait" \
  -M raspi3 \
  -m 1G \
  -serial stdio \
  -drive "file=ubuntu-20.04.img,if=none,id=drive0,cache=writeback,format=raw" \
  -device "virtio-blk,drive=drive0,bootindex=0" \
  -no-reboot

  # -device "virtio-blk,drive=drive0,bootindex=0"
  # -net user,hostfwd=tcp::5022-:22,vlan=0


# qemu-system-arm -dtb bcm2709-rpi-2-b.dtb -sd ubuntu-core.qcow


# qemu-system-aarch64 \
#   -nographic \
#   -machine virt,gic-version=max \
#   -m 512M \
#   -cpu max 
#   -smp 4 \

#   -netdev user,id=vnet,hostfwd=:127.0.0.1:0-:22 \
#   -device virtio-net-pci,netdev=vnet \

#   -drive file=ubuntu-image.img,if=none,id=drive0,cache=writeback \
#   -device virtio-blk,drive=drive0,bootindex=0 \

#   -drive file=flash0.img,format=raw,if=pflash \
#   -drive file=flash1.img,format=raw,if=pflash 
