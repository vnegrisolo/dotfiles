#!/bin/sh

mux() {
  if [ -z "$@" ]; then
    echo 'usage ./tmux.sh <project_name> [<project2]';
  fi

  for project in "$@"; do
    cd ${project};

    project=${project%/};
    project=${project//\./-}

    tmux new -d -s ${project};

    tmux rename-window -t ${project}:0 code;
    tmux select-window -t ${project}:0;
    tmux split-window -h 'vim .';

    tmux new-window;
    tmux rename-window -t ${project}:1 server;

    tmux select-layout -t ${project}:0 main-vertical;
    tmux select-window -t ${project}:0;

    echo "New session on tmux=${project}";
    cd ..;
  done

  echo "Tmux sessions:"
  tmux ls;
}
