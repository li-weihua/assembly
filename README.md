# assembly learning

[x64 gcc calling convention](./call_convention/abi_x64_gcc.md)

## cross compiling

ubuntu need install **gcc-aarch64-linux-gnu** and  **g++-aarch64-linux-gnu** package, and use the following command compile for arm 64:

```bash
aarch64-linux-gnu-gcc -c input.c
aarch64-linux-gnu-g++ -c input.cc
```

## check whether virtual os

```bash
cat /proc/scsi/scsi
```
QEMU output:
```
Attached devices:
Host: scsi1 Channel: 00 Id: 00 Lun: 00
  Vendor: QEMU     Model: QEMU DVD-ROM     Rev: 1.5.
  Type:   CD-ROM                           ANSI  SCSI revision: 05
```

real os output:
```
Attached devices:
Host: scsi0 Channel: 00 Id: 00 Lun: 00
  Vendor: ATA      Model: WDC WD5000LPVX-0 Rev: 1A05
  Type:   Direct-Access                    ANSI  SCSI revision: 05
```

## QEMU + Ubuntu ARM aarch64

https://gist.github.com/oznu/ac9efae7c24fd1f37f1d933254587aa4

Get Ubuntu Image and QEMU EFI:
```bash
wget https://cloud-images.ubuntu.com/releases/16.04/release/ubuntu-16.04-server-cloudimg-arm64-uefi1.img
wget https://releases.linaro.org/components/kernel/uefi-linaro/latest/release/qemu64/QEMU_EFI.fd
```

