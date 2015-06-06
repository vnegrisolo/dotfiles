# Git Cheatsheet

* `git status`
* `git branch`
* `git branch -a` - all branches including remotes
* `git remote prune origin` - remove remote references to deleted branches
* `git branch --merged master` - list local branches merged with master
* `git remote -v` - remote information
* `git pull origin master`
* `git push origin master`
* `git pull --rebase origin master`
* `git pull --rebase; bundle; git fetch; git remote prune origin; git branch --merged master`
* `git merge featured_branch`
* `git diff`
* `git commit -m 'commit message'`
* `git commit -am 'commit message'` - commits all tracked files
* `git branch featured_branch`
* `git checkout featured_branch`
* `git checkout -b featured_branch`
* `git branch -d featured_branch`
* `git push origin :featured_branch`
* `git submodule init`
* `git submodule update`
* `git bisect start; git bisect bad; git bisect good <rev>` - so you start test and say if its bad or good
* `git bisect visualize`
