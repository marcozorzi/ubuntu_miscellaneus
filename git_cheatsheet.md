# git cheat sheet
keep all useful commands here

# Move local uncommitted changes to new branch
while on master (for example) :
```
git checkout -b <new branch name>
```

# Remove committed files and local changes which have not been pushed
```
git reset HEAD^
```

# Delete local branches that have been merged in remote
This must be done from a branch that you want to keep, such as master. It does not delete the branch you are in even if it has already been merged
Also it does not delete branches containing "master" or "main" or "dev"
```
git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -d
```

