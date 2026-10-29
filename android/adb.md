# ADB Commands
## Filter logs
	adb logcat AndroidRuntime:I com.luxoft.carbon:I *:S ApplicationManager:I
## Screen Mirror
	adb shell screenrecord --ouput-format=h264 - | ffplay -
	adb shell screenrecord --bit-rate=16m --output-format=h264 --size 800x600 - | ffplay -framerate 60 -framedrop -bufsize 16M -

## Reboot image via AVD
```
adb reboot
```

## Reboot with Serial
```
adb -s <device_serial> reboot
```
## Device Info
```
adb devices
```

## ADB install APK
```
adb install <apk_path>
```
## List installed packages
```
adb shell pm list packages
```

## Get App pid
```
adb shell pidof <package_name>
```

### ------------------------LOGCAT-------------------------- 

## Filter by PID
```
adb logcat --pid=12345
```


## System shutdown via adb

```
# boot to shell first
adb shell reboot -p

adb shell am start -n android/com.android.internal.app.ShutdownActivity

```


