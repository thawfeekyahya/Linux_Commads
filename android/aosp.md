
### ============================= Reposync Commands =============================

## Clean / Reset Repo

```
# 1. Reset all git repositories in the repo workspace to match manifest HEADs
repo forall -c 'git reset --hard HEAD'

# 2. Clean out untracked files/directories across all submodules
repo forall -c 'git clean -fdx'
```

## Sync

```
repo sync -c -j$(nproc) --fail-fast
```

## AOSP build output folder

```
<asop>/out/target/product/<product_id>
```

## Repo status

```
repo status // check the status
repo info // check the repo info

```

## Repo Snapshot
In the Android Open Source Project (AOSP), the repo manifest command generates an XML manifest file that reflects the exact current state of your local checkout.
```
repo manifest -r -o pinned_manifest.xml
```


## Lunch commands

```
lunch2 --help // View lunch help commands

list_products -> List all avaiable lunch commands
list_variants -> List all build variants

// For release configs
list_release_configs ( this not  working for some reason)
or
cat build/release/release_config_map.textproto

ap4a 
a-> Android Major release ( here a is for android 15)
p-> Platform ( 1,2,3.. denotes android sub-release from the main release)
a-> Primary base line ( mostly 'a' by default other variants  are used for custom baselines (b,c ..) internally used by Google)


bp4a
b-> Android Major (Version 16)

```

### Lunch command selection

Running lunch only sets variables for the **ACTIVE** shell session. If you open a new terminal window or close your existing session, those environment variables **RESET** to blank.


```
example: <product>-<release-config>-<variant>

//NOTE the hyphen here, the product name always follows internally '_' like aosp_tangrpro_car

example: aosp_tangorpro_car-ap3a-userdebug

```

## Clean build folder

```
m clean
m installclean
rm -rf out/

// Unset Lunch command
unset TARGET_PRODUCT TARGET_BUILD_VARIANT TARGET_RELEASE TARGET_DEVICE ANDROID_PRODUCT_OUT ANDROID_BUILD_TOP

```

## Adding a new device configs

Use the information in this page to create the makefiles for your device and product.
https://source.android.com/docs/setup/create/new-device


## AOSP folder structure

```

├── Android.bp -> build/soong/root.bp
├── aosp-patches
├── art
├── bionic
├── bootable
├── bootstrap.bash -> build/soong/bootstrap.bash
├── build
├── BUILD -> build/bazel/bazel.BUILD
├── build.sh -> vendor/qcom/opensource/core-utils/build/build.sh
├── cts
├── dalvik
├── developers
├── development
├── device --> it contains the entire board configurations, hardware definitions, device trees, and build Makefiles required to compile Android for specific hardware targets.
├── disregard
├── emulator-patches
├── external
├── frameworks
├── hardware
├── kernel
├── libcore
├── libnativehelper
├── lk_inc.mk
├── maria-system
├── mbcatbox
├── out
├── packages
├── pdk
├── platform_testing
├── prebuilts
├── qc-patches
├── sdk
├── system
├── test
├── toolchain
├── tools
├── trusty
├── vendor
└── WORKSPACE -> build/bazel/bazel.WORKSPACE

```


