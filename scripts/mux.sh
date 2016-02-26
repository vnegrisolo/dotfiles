#!/bin/sh

project=$1;
layout=$2;

if [ -z "${layout}" ]; then
  layout="all"
fi

if [ -z "${project}" ] || [ -z "${layout}" ]; then
  echo 'usage ./tmux.sh <project_name> <layout = [code|server|all]>';
  exit 1;
fi

tmux new -d -s ${project} -c ${project};

index=0;
if [ $layout = 'code' ] || [ $layout = 'all' ]; then
  tmux rename-window -t ${project}:${index} code;
  tmux select-window -t ${project}:${index};
  tmux split-window -h -c ${project} 'vim .';
fi

if [ $layout = 'all' ]; then
  index=1;
  tmux new-window -t ${project} -c ${project};
fi
if [ $layout = 'server' ] || [ $layout = 'all' ]; then
  tmux rename-window -t ${project}:${index} server;
  tmux select-window -t ${project}:${index};
  tmux split-window -v -c ${project};
fi

tmux select-window -t ${project}:0;

tmux a -t ${project};
