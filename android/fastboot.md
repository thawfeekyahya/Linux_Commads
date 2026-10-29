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
