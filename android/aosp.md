
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


## AOSP list all lunch commands

```
list_products -> List all avaiable lunch commands
list_variants -> List all build variants


```


