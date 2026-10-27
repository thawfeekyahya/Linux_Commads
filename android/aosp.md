
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


```
example: <product>-<release-config>-<variant>

//NOTE the hyphen here, the product name always follows internally '_' like aosp_tangrpro_car

example: aosp_tangorpro_car-ap3a-userdebug

```

## Clean build folder

```
make clean
rm -rf out/
```


