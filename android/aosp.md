
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


