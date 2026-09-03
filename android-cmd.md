
### =========================Configs=========================
## AVD Config
```
cat ~/.android/avd/<AVD_NAME>.avd/config.ini
```
## Android SDK Setup
```
#------------------------- ANDROID SDK SETTINGS -------------------------# 
export ANDROID_HOME=/Users/YAHYATH/Project/android_sdk
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH
export PATH=$ANDROID_HOME/emulator:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/build-tools/32.0.0:$PATH

# Java Version Switcher Shortcuts
alias java11='export JAVA_HOME=$(/usr/libexec/java_home -v 11); export PATH="$JAVA_HOME/bin:$PATH"; java -version'
alias java17='export JAVA_HOME=$(/usr/libexec/java_home -v 17); export PATH="$JAVA_HOME/bin:$PATH"; java -version'
alias java21='export JAVA_HOME=$(/usr/libexec/java_home -v 21); export PATH="$JAVA_HOME/bin:$PATH"; java -version'
alias java25='export JAVA_HOME=$(/usr/libexec/java_home -v 25); export PATH="$JAVA_HOME/bin:$PATH"; java -version'

export JAVA_HOME=$(/usr/libexec/java_home -v 21)
#export PATH=$JAVA_HOME/bin:$PATH

#--------------------------------------------------# 
```
### =========================ADB Commands=========================
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

### =========================AVD Commands=========================
## List available AVDs
```
emulator -list-avds
```

## Star with no snapshot
```
emulator -avd <AVD_NAME> \
    -no-snapshot-load \
    -no-snapshot-save
```

## Wipe Data
```
emulator -avd <AVD_NAME> -wipe-data
```

## Check AVD host camera support
```
emulator -webcam-list

emulator -avd MyAVD \
    -camera-front webcam0
```

### =========================App Building=========================
## Align & Sign APK (OneLiner)
```
zipalign -p  4 ./app/build/release-unsigned.apk ./app/build/release-aligned.apk && 
apksigner sign --ks ../Samples.keystore --ks-key-alias sample ./app/build/release-aligned.apk && 
apksigner verify --verbose ./app/build/release-aligned.apk
```
