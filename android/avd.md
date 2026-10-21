

### =========================Configs=========================
## AVD Config
```
cat ~/.android/avd/<AVD_NAME>.avd/config.ini
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
