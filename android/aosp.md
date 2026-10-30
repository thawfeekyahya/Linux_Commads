
## Clean / Reset Repo

```
# 1. Reset all git repositories in the repo workspace to match manifest HEADs
repo forall -c 'git reset --hard HEAD'

# 2. Clean out untracked files/directories across all submodules
repo forall -c 'git clean -fdx'

# 3. Force clean all
repo forall -c 'git clean -ffdx'

# 4. Sync changes after clean

repo sync -c -j$(nproc) --fail-fast

# 5. Sync / reset submodules
repo forall -c 'git submodule update --init --recursive'

# 6. Force Sync
repo sync --force-sync <path_to_submodule>
// -d here for detached branch
repo sync --force-sync -d external/boost vendor/qcom/proprietary ```

## Clean build folder

```
m clean
m installclean
rm -rf out/

// Unset Lunch command
unset TARGET_PRODUCT TARGET_BUILD_VARIANT TARGET_RELEASE TARGET_DEVICE ANDROID_PRODUCT_OUT ANDROID_BUILD_TOP

```
## Run Test build
In Android AOSP, running m nothing runs a lightweight build execution using Soong/Ninja that parses all Android build files (Android.bp and Android.mk), constructs the entire build dependency graph, and verifies build syntax without actually compiling any code or generating binary outputs.

```
m nothing
```
## Start AOSP build

```
m -j$(nproc)
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
## Repo manifest file

After you run repo init and repo sync, the manifest files are stored inside the hidden .repo directory at the root of your workspace.

Specifically, you can find and edit them here:

The Specific File (default.xml):.repo/manifests/default.xml
The Active Symlink:.repo/manifest.xml(This is a symlink that points directly to whichever manifest XML file is currently active in your workspace.)

```
.repo/manifests
```
To switch to different manifest

```
repo init -m <file>
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


## Adding a new device configs

Use the information in this page to create the makefiles for your device and product.
https://source.android.com/docs/setup/create/new-device


## AOSP folder structure

NOTE: Generic lunch config exists under

```
build/make/target/product/
```

```

.
├── art/                # Android Runtime: Garbage collector, dex2oat compiler, and core runtime libraries.
├── bionic/             # Android's custom C standard library (libc, libm, libdl, and dynamic linker).
├── bootable/           # Bootloader reference code and the Android Recovery OS source.
├── build/              # Core build system framework (Soong, Blueprint, GNU Make logic, envsetup.sh).
├── cts/                # Compatibility Test Suite: Automated tests to verify Android API compliance.
├── dalvik/             # Legacy Dalvik VM utilities, bytecode inspection tools, and dx converter.
├── developers/         # Developer reference projects, code samples, and demo applications.
├── development/        # Developer host tools, test frameworks, and development helper utilities.
├── device/             # Device trees, hardware configurations (BoardConfig.mk), and lunch targets.
├── external/           # Third-party open-source libraries (SQLite, BoringSSL, Skia, Protobuf, Zlib).
├── frameworks/         # Core platform APIs: frameworks/base (System UI, WindowManager), frameworks/av (media), frameworks/native.
├── hardware/           # Hardware Abstraction Layer (HAL) AIDL/HIDL interface definitions and reference drivers.
├── kernel/             # Build tools, configurations, and header references for the Linux Kernel/GKI.
├── libcore/            # Java core libraries (java.lang, java.util, java.io) derived from OpenJDK.
├── libnativehelper/    # Native helper functions and utilities for JNI (Java Native Interface) interactions.
├── packages/           # System apps (Launcher3, Settings, Camera), Content Providers, and System Services.
├── pdk/                # Platform Development Kit resources used for vendor hardware bring-up.
├── platform_testing/   # Integration, performance, and automated system testing frameworks (VTS, TradeFed).
├── prebuilts/          # Pre-compiled toolchains (Clang/LLVM, Rust, JDK, NDK) for deterministic builds.
├── sdk/                # Android SDK components, build tools sources, and emulator integrations.
├── system/             # Core OS daemons and C/C++ native services (init, vold, netd, adb, fastboot).
├── toolchain/          # Compiler toolchain management scripts, PGO profiles, and benchmarks.
├── tools/              # Engineering tools, API linters (metalava), git hooks, and test harnesses.
└── vendor/             # Proprietary binaries, GPU drivers, HAL implementations, and vendor blobs.
```

