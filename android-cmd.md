## Align & Sign APK (OneLiner)
```
zipalign -p  4 ./app/build/release-unsigned.apk ./app/build/release-aligned.apk && 
apksigner sign --ks ../Samples.keystore --ks-key-alias sample ./app/build/release-aligned.apk && 
apksigner verify --verbose ./app/build/release-aligned.apk
```
