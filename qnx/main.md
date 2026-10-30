## Important Concepts

### OVMF (Open Virtual Machine Firmware)

OVMF stands for Open Virtual Machine Firmware. It is a project under Tianocore (an open-source project based on Intel’s EDK II) that provides UEFI (Unified Extensible Firmware Interface) support for virtual machines running on QEMU and KVM.


### BSP

In embedded development (Linux, RTOS, Android), a Board Support Package (BSP) is the collection of hardware-specific drivers, initialization routines, and configuration files that enables a target operating system to run on a specific hardware board or System-on-Chip (SoC).

NOTE: You **NEED** to build it . BSP alone is not sufficient to run the target board. The BSP provides the necessary software components to interface with the hardware, but it does not include the complete operating system or application software required for a fully functional system. To run the target board, you typically need to combine the BSP with an operating system (such as QNX, Linux, or Android) and any additional application software that you want to run on the board.


### EFI / UEFI

EFI originally stood for:
Extensible Firmware Interface

and later evolved into:
UEFI — Unified Extensible Firmware Interface

So an .efi file is an executable that the UEFI firmware knows how to load and execute.


## BSP Generic images

Here *x86_64-generic-uefi-hypervisor.build* is the hypervsior build receipe and *x86_64-generic-uefi.efi* is prebuilt image for generic uefi target

```
neo@neo-ThinkBook-16-G6-ABP:~/opt/qnx800/bsp/BSP_x86_64_be-800_SVN1019295_JBN337$ tree -L 3 images/generic-uefi
images/generic-uefi
├── definitions.m4
├── Makefile
├── x86_64-generic-uefi.build
├── x86_64-generic-uefi.efi
├── x86_64-generic-uefi-hypervisor.build
├── x86_64-generic-uefi-smmu.build
└── x86_64-generic-uefi-smmu.efi
```
## QNX Software center location

```
/home/neo/qnx/qnxsoftwarecenter/
```

## QNX Initial setup

```
source /home/neo/opt/qnx800/qnxsdp-env.sh

echo $QNX_HOST
echo $QNX_TARGET

ls $QNX_TARGET
```

## Boot x864 UEFI target in QEMU

### Prebuilt BSP download location

```
  /home/neo/opt/qnx800/bsp/
```

### Copy the UEFI image to tmp location

```
cp \
  /home/neo/opt/qnx800/bsp/BSP_x86_64_be-800_SVN1019295_JBN337/images/generic-uefi/x86_64-generic-uefi.efi \
  /tmp/qnx-lab/x86_64-generic-uefi.efi
```

### Copy the OVMF (VARS & CODE) firmware to tmp location

**VARS** -> is the variable store for UEFI firmware 
**CODE** -> is the actual firmware code that runs on the virtual machine. Both are required for UEFI booting in QEMU.

*Note:* Why two variable files? OVMF_VARS_4M.fd is our clean template; qnx-vars.fd is the writable copy we'll pass to QEMU. The firmware code will remain read-only.

```
cp /usr/share/OVMF/OVMF_CODE_4M.fd /tmp/qnx-lab/OVMF_CODE_4M.fd

cp /usr/share/OVMF/OVMF_VARS_4M.fd /tmp/qnx-lab/OVMF_VARS_4M.fd

cp /tmp/qnx-lab/OVMF_VARS_4M.fd /tmp/qnx-lab/qnx-vars.fd
```
### Create a IMG file for the UEFI image

```
truncate -s 64M /tmp/qnx-lab/qnx-esp.img
```

### Format the IMG file with FAT32 filesystem

```
mkfs.fat -F 32 /tmp/qnx-lab/qnx-esp.img

# Verify the filesystem
file /tmp/qnx-lab/qnx-esp.img

```

### Mount the IMG file and copy the UEFI image to it

```
sudo mkdir -p /mnt/qnx-lab-esp
sudo mount -o loop /tmp/qnx-lab/qnx-esp.img /mnt/qnx-lab-esp

#Verify
findmnt /mnt/qnx-lab-esp
```

### Copy the UEFI image to the mounted IMG file

Why change the filename?
- Original: x86_64-generic-uefi.efi
- Destination: EFI/BOOT/BOOTX64.EFI
BOOTX64.EFI is the standard fallback filename for 64-bit x86 UEFI systems. We're copying the executable, not modifying its contents.

```
sudo mkdir -p /mnt/qnx-lab-esp/EFI/BOOT

sudo cp \
  /tmp/qnx-lab/x86_64-generic-uefi.efi \
  /mnt/qnx-lab-esp/EFI/BOOT/BOOTX64.EFI

# Verify
ls -lh /mnt/qnx-lab-esp/EFI/BOOT/BOOTX64.EFI

# Unmount the IMG file after copying the UEFI image

sync
sudo umount /mnt/qnx-lab-esp
```

### Boot the UEFI target in QEMU

```
qemu-system-x86_64 \
  -m 2048 \
  -drive if=pflash,format=raw,readonly=on,file=/tmp/qnx-lab/OVMF_CODE_4M.fd \
  -drive if=pflash,format=raw,file=/tmp/qnx-lab/qnx-vars.fd \
  -drive file=/tmp/qnx-lab/qnx-esp.img,format=raw,if=ide \
  -serial stdio
```
