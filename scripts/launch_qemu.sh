#!/bin/bash -e
PROJ_ROOT="$(dirname $(dirname ${BASH_SOURCE:-$0}))"
cd "${PROJ_ROOT}"

PAHT_TO_EFI="$1"
rm -rf mnt
mkdir -p mnt/EFI/BOOT
cp "$PAHT_TO_EFI" mnt/EFI/BOOT/BOOTX64.EFI
qemu-system-x86_64 \
    -bios third_party/ovmf/RELEASEX64_OVMF.fd \
    -drive file=fat:rw:mnt,format=raw \
    -device isa-debug-exit,iobase=0xf4,iosize=0x01