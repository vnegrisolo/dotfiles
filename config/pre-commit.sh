#!/bin/bash

if [ $(git symbolic-ref HEAD 2>/dev/null) == 'refs/heads/master' ]; then
  echo 'Cannot commit to master branch';
  exit 1;
fi
exit 0;
