
# Make tar from commits
```
git archive --output=file.zip HEAD $(git diff --name-only simulation/catwoman/develop-advui-dialogmanager -- if1/  simulation/deadpool/develop-advui -- if1/ --diff-filter=ACM)
git archive --format=tar --prefix=gitArchived/ BRANCH_NAME folder/filename | (cd /home/osboxes/temp/ && tar xf -) [ extract with directory info ]
git archive --format=tar --prefix=gitArchived/ HEAD:folder/folder2/ -- filename | (cd /home/osboxes/temp/ && tar xf -) [ extract file without dir info ]
git diff-tree -r --no-commit-id --name-only --diff-filter=ACMRT $commit_id | tar -czf file.tgz -T -
```

# Move files after cherry-pick

```
for f in $(git ls-files); do git mv $f /home/thyahya/Projects/carbon-ui/uikit/uisdk/src_wl/assets; done
```

# Git Adding a new worktree
https://git-scm.com/docs/git-worktree 
```
git worktree add branch path
```

# Git Worktree with origin/remotes
```
git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
git fetch
git branch -r
```

# Git Search
https://git-scm.com/book/en/v2/Git-Tools-Searching 
```
git log -S "expression"
```

# Git view submodle hash
```
git ls-tree branch_name path/to/submodule
```

