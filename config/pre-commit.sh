#!/bin/sh

# Check to see if we are on master branch. Stop accidental commits
if [ $(git symbolic-ref HEAD 2>/dev/null) == "refs/heads/master" ]
then
  echo "Cannot commit to master branch"
  exit 1
fi
exit 0
