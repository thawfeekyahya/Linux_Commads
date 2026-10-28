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

## BSP location

```
/home/neo/qnx/bsp/
```

## Initial boot

```
source /home/neo/opt/qnx800/qnxsdp-env.sh

echo $QNX_HOST
echo $QNX_TARGET

ls $QNX_TARGET
```

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

