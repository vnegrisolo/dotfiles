#!/bin/sh

gcpast() {
  if [ -z "$1" ]; then
    echo 'usage: gcpast <commit-ref>';
    return 0;
  fi

  git stash -k;
  git commit --fixup ${1};
  git rebase -i ${1}~1
  git stash pop;
}
