# Fastboot flashing

## Transition to fast boot mode

**Note: its important to boot into bootloader first before going into flastboot mode**

```
adb reboot bootloader

# Boot into fastboot mode
fastboot reboot fastboot

#Show devices available to fastboot mode

fastboot devices

```

## Start flashing process

Wipe user data

```
fastboot -w

```
### Flash system img files

Android 10 or newer with Dynamic Partitions (super.img), standard Fastboot cannot write directly to system. Switch to Fastbootd

```
fastboot flash system system.img

# Exit after flash
fastboot reboot
or
fastboot continue
```

## Unpacking a Super Img

Since Android 10, physical devices use Dynamic Partitions. Instead of having fixed physical partition sizes on the flash storage, Android combines multiple logical partitions—primarily vendor, vendor_dlkm, system, product, and system_ext—into one big physical container called super.img

Android may share img files raw Linux compatiable files or Android sparse image,

```
# use file command to check its type

file vendor.img

#output option 1 : Linux rev 1.0 ext4 filesystem data
#output option 2 : Android Sparse Image
```

If the image type is android sparse , you need the below tools, else follow the step to mount.

### Tools required

Both of these tools are part of AOSP build , located at
 *aosp/TANGOPRO_MBOS_ANDROID15_BUILD/out/host/linux-x86/bin/*

```
simg2img
lpunpack
```
### Mount the img files

```
# For vendor.img

mkdir -p /tmp/vendor_mount
sudo mount -o loop,ro vendor.img /tmp/vendor_mount
mkdir -p ~/Workspace/extracted_vendor
sudo cp -a /tmp/vendor_mount/* ~/Workspace/extracted_vendor/
sudo umount /tmp/vendor_mount

# For vendor_dlkm.img

mkdir -p /tmp/vendor_mount
sudo mount -o loop,ro vendor_dlkm.img /tmp/vendor_mount
mkdir -p ~/Workspace/extracted_vendor_dlkm
sudo cp -a /tmp/vendor_mount/* ~/Workspace/extracted_vendor_dlkm/
sudo umount /tmp/vendor_mount

```
### Copy vendor files to AOSP source code

```
cp -a ~/Workspace/extracted_vendor_dlkm/* vendor/google/tangorpro/proprietary/modules/
cp -a ~/Workspace/extracted_vendor/* vendor/google/tangorpro/proprietary/modules/
```


