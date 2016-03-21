#!/bin/sh

mux() {
  echo "mux running"
  project=${1%/};

  if [ -z "${project}" ]; then
    echo 'usage ./tmux.sh <project_name>';
  else
    cd ${project};
    tmux new -d -s ${project};

    tmux rename-window -t ${project}:0 code;
    tmux select-window -t ${project}:0;
    tmux split-window -h 'vim .';

    tmux new-window;
    tmux rename-window -t ${project}:1 server;

    tmux select-window -t ${project}:0;

    echo "New session on tmux=${project}";
    cd ..;
  fi

  echo "Tmux sessions:"
  tmux ls;
}
